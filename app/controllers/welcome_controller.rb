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
    @name = params[:search]
    @category = Category.find(params[:category_id])
    @sub_category = Category.find( params[:product][:category_id])
    @products = Product.where(name: @name, category_id: params[:product][:category_id])
    respond_to :js
  end

end
