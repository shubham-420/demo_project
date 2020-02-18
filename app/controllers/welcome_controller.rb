class WelcomeController < ApplicationController
  def index
  	render :layout => 'admin'
  	#redirect_to products_new_path
  end
end
