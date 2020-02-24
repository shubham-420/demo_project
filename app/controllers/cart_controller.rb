class CartController < ApplicationController
  
  def index
  	@order_item = OrderItem.all
  end

  def new
  	@order_item = OrderItem.new
  end

  def create
  	@order_item = @order.order_items.create(params.require[:product_id])
  end

end
