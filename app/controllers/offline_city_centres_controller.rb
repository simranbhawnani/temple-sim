class OfflineCityCentresController < ApplicationController
  before_action :find_offline_city_centre, only: [:show, :update, :destroy]
  
  def show
    render json: {type: 'success', temple_history_detail: @offline_city_centre}, status: 200
  end

  def new
    @offline_city_centre = OfflineCityCentre.new
  end

  def create
    @offline_city_centre = OfflineCityCentre.new(offline_city_centres_params)
    if @offline_city_centre.save
      render json: {type: 'success', message: 'Offline city centre successfully created!',offline_city_centre: @offline_city_centre}, status: 200
    else
      render json: {type: 'failed', message: 'Failed to create'}, status: 403
    end
  end

  def update
    if @offline_city_centre.update(offline_city_centres_params)
      render json: {type: 'success', message: 'Update successfully', offline_city_centre: @offline_city_centre}, status: 200
    else
      render json: {type: 'failed', message: 'Failed to update'}, status: 403
    end
  end

  def destroy
    if @offline_city_centre.destroy
      render json: {type: 'success', message: 'Offline city centre successfully destroyed!'}, status: 200
    else
      render json: {type: 'failed', message: 'Failed to destroyed!'}, status: 403
    end
  end

  private

    def find_offline_city_centre
      @offline_city_centre = OfflineCityCentre.find(id: params[:id])
    end

    def offline_city_centres_params
      params.require(:offline_city_centre).permit(:address, :city, :state, :pincode, :mail_id, :phone_no, :temple_id)
    end
end
