class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  helper_method :processed_order
  layout 'admin'

  def index
    @total = 0
    @order = current_user.orders.find_by(status: "pending")
    if !@order.nil?
      @order_items = @order.order_items
      @addresses = current_user.locations
    end
  end

  def new
    @order_items = OrderItem.new
    @order = Order.new
  end

  def create
    @order = current_user.orders.find_or_create_by(status: "pending")
    if !@order.order_items.find_by(product_id: params[:order][:product_id])
      @order_item = create_order
    else
      old_item = @order.order_items.find_by!(product_id: params[:order][:product_id])
      item_new_quantity = params[:quantity]
      total_quantity = old_item.quantity +  item_new_quantity.to_i
      old_item.update(quantity: total_quantity)
      flash[:notice] = "Already Added in cart"
    end
      redirect_to orders_path, method: :get
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to orders_path
  end

  def create_order
    return @order.order_items.create!(product_id: params[:order][:product_id], quantity: params[:quantity], price: params[:order][:price])
  end

  def allorder
    @allorders = current_user.orders.where(status: "done")
    # render plain: @allorders
  end

  def processed_order
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: "done")
    redirect_to orders_allorder_path
  end

  def checkout
    @order = Order.find(params[:id])
    # render plain: "sadf"
  end

  def show
    # processed_order
    @locations = current_user.locations
  end
  # def order_now  
  #   @order = Order.find(params[:id])
  #   if @order.update(status: "done")
      # redirect_to @order
      # render plain: "sdaf"
  #   end
  # end
end
