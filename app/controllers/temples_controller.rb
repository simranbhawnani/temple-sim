class TemplesController < ApplicationController
  skip_before_action :verify_authenticity_token

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
    @temple = Temple.find(params[:id])
    if @temple.update(temple_params)
      render json: {type: 'success', message: 'Update successfully'}, status: 200
    else
      flash[:error] = @temple.errors.messages
      redirect_back(fallback_location: temples_path)
    end
  end

  private

    def temple_params
      params.require(:temple).permit(:temple_name, :description, :temple_email, :phone_no, :temple_address, :city, :state, :country, :zipcode, :start_time, :end_time, :temple_images)
    end
end

