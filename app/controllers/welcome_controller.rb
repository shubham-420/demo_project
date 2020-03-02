class WelcomeController < ApplicationController
  layout 'admin'
  helper_method :user_role
  def index
    if user_signed_in?
      if user_role == 'buyer'
        @products = Product.paginate(page: params[:page], per_page: 5) 
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
    respond_to do |format|
      format.js
    end
  end

end
