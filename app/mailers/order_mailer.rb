class OrderMailer < ApplicationMailer
  def new_order_email
    @order = params[:order]
    @user = User.find(@order.user_id)
    @location = Location.find(@order.location_id)
    mail(to: 'mehtashubham543@gmail.com', subject: "You got a new order!")
  end
end
