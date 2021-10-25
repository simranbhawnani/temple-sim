class TemplesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_temple, only: [:show, :update, :destroy]

  def index
    @temples = Temple.all
    render json: {type: 'success', temples: @temples}, status: 200
  end

  def show
    render json: {type: 'success', temple: @temple}, status: 200
  end
  
  def new
    @temple = Temple.new
  end

  def create
    @temple = Temple.new(temple_params)
    if @temple.save
      render json: {type: 'success', message: 'Temple successfully created!',temple: @temple}, status: 200
    else
      flash[:error] = 'Temple Name already exists!'
      redirect_back(fallback_location: new_temple_path)
    end
  end

  # def edit
  #   @temple = Temple.find(params[:id])
  # end

  def update
    if @temple.update(temple_params)
      render json: {type: 'success', message: 'Update successfully'}, status: 200
    else
      flash[:error] = @temple.errors.messages
      redirect_back(fallback_location: temples_path)
    end
  end

  def destroy
    if @temple.destroy
      render json: {type: 'success', message: 'Temple successfully destroyed!'}, status: 200
    else
      render json: {type: 'Failed', message: 'Failed to destroyed!'}
    end
  end

  private

    def find_temple
      @temple = Temple.find(params[:id])
    end

    def temple_params
      params.require(:temple).permit(:temple_name, :description, :temple_email, :phone_no, :temple_address, :city, :state, :country, :zipcode, :start_time, :end_time, :temple_images)
    end
end

