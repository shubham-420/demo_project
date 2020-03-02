class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token  
  layout 'admin'

  def index
    @order = current_order
    @order_items = @order.order_items
    @addresses = current_user.locations
  end

  def new
    @order_items = OrderItem.new
    @order = Order.new
  end

  def create
    @order = current_order
    old_item = @order.order_items.find_by(product_id: params[:order_items][:product_id])
    if !old_item
      @order_item = @order.order_items.build order_item_params
      @order_item.save
    else
      total_quantity = old_item.quantity + params[:order_items][:quantity].to_i
      old_item.update(quantity: total_quantity)
    end
    flash[:notice] = "Item Added in cart"
    redirect_to orders_path, method: :get
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to orders_path
  end

  def update
    @order = Order.find(params[:id])
    
    @location = Location.find(params[:order][:location_id])
    @order.update!(status: "done",location_id: @location.id)
    OrderMailer.with(order: @order).new_order_email.deliver_later
    flash[:notice] = "Successfully placed Order" 
    redirect_to order_path, method: :get
  end

  def checkout
    @order = Order.find(params[:id])
  end

  def show
    @allorders = current_user.orders.where(status: "done")
  end

  private

  def order_item_params
    params.require(:order_items).permit(:product_id, :quantity, :price) 
  end 

end 
