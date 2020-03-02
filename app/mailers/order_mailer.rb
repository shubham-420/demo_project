class OrderMailer < ApplicationMailer
  def new_order_email
    @order = params[:order]
    @user = User.find(@order.user_id)
    @location = Location.find(@order.location_id)
    mail(to: @user.email, subject: "You got a new order!")
  end

  def seller_order_email
    @products = Array.new
    @order = Order.find(params[:order][:id])
    @buyer = @order.user
    @seller = User.find(params[:user_id])
    @products = params[:products]
    # binding.pry
    mail(to: @seller.email, subject: "You got a new order!")

  end

end
