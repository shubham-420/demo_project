class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :get_order_items
  helper_method :get_category

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :name, :age, :number, :role, :avatar])
  end
  
  def current_order
    current_user.orders.find_or_create_by(status: "pending")
  end


  def get_order_items
    order = current_user.orders.find_by(status: "pending")
    if !order.nil?
      return order.order_items.count
    else
      return 0
    end
  end

  def get_category(product)
    if !product.nil?
      Category.find(product.category.parent_category_id).name
    end
  end
end
