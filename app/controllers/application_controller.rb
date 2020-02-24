class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :get_order_items
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :name, :age, :number, :role, :avatar])
  end

  def get_order_items
    order = current_user.orders.find_by(status: "pending")
    if !order.nil?
      return order.order_items.count
    else
      return 0
    end
  end
  
end
