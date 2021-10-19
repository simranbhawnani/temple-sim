class OfflineCityCentresController < ApplicationController
  def show
    @offline_city_centre = OfflineCityCentre.find(params[:id])
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
      flash[:error] = 'Falied to create!'
      redirect_back(fallback_location: new_offline_city_centre_path)
    end
  end

  def update
    @offline_city_centre = OfflineCityCentre.find(params[:id])
    if @offline_city_centre.update(offline_city_centres_params)
      render json: {type: 'success', message: 'Update successfully', offline_city_centre: @offline_city_centre}, status: 200
    else
      flash[:error] = @offline_city_centre.errors.messages
      redirect_back(fallback_location: offline_city_centres_path)
    end
  end

  def destroy
    @offline_city_centre = OfflineCityCentre.find(params[:id])
    if @offline_city_centre.destroy
      render json: {type: 'success', message: 'Offline city centre successfully destroyed!'}, status: 200
    else
      render json: {type: 'Failed', message: 'Failed to destroyed!'}
    end
  end

  private

    def offline_city_centres_params
      params.require(:offline_city_centre).permit(:address, :city, :state, :pincode, :mail_id, :phone_no, :temple_id)
    end
end
