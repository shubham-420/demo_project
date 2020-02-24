class WelcomeController < ApplicationController
  helper_method :user_role
  def index
    if user_signed_in?
      if user_role == 'buyer'
        @products = Product.all
        user_role
        render layout: "admin"
      else
        render layout: "admin"
      end 
    end 
  end

  def user_role
    current_user.role
  end

end
