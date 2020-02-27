class WelcomeController < ApplicationController
  layout 'admin'
  helper_method :user_role
  def index
    if user_signed_in?
      if user_role == 'buyer'
       # binding.pry
        @products = Product.all
      else
        user_role
        render layout: "admin"
      end
    else
      render layout: "admin"
    end 
  end

  def user_role
    current_user.role
  end

  def search
    # binding.pry
    @products = Product.where(name: params[:search])
    respond_to :js
  end

end
