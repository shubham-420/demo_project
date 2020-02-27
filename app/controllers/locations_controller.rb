class LocationsController < ApplicationController
  skip_before_action :verify_authenticity_token  
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  def index
    @locations = current_user.locations
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = current_user.locations.create(location_params)
    if @location.save
      redirect_to orders_path, method: :put
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    
    def location_params
      params.require(:location).permit(:state, :country, :home, :pincode)
    end
end
