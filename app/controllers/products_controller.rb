class ProductsController < ApplicationController
  before_action :set_product, only: [:show , :edit , :destroy , :update]
  layout 'admin'

  def index
    @products = current_user.products
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.create!(product_params)
  end
 
  def show; end

  def edit; end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def update
  if @product.update(product_params)
    redirect_to @product
  else
    render 'edit'
  end
end

   private
  def product_params
    params.require(:product).permit(:name, :description, :price, :tax, :category_id)
  end

  def set_product
    @product = Product.find(params[:id]) 
  end
end
