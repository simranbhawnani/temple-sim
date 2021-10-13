class TemplesController < ApplicationController

  def index
    @temple_history_details = TempleHistoryDetail.all
    render json: {temple_history_detail: @temple_history_detail}
  end

  def show
    @temple = Temple.find(params[:id])
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
    @temple = Temple.find(params[:id])
    if @temple.update(temple_params)
      render json: {type: 'success', message: 'Update successfully'}, status: 200
    else
      flash[:error] = @temple.errors.messages
      redirect_back(fallback_location: temples_path)
    end
  end

  def destroy
    @temple = Temple.find(params[:id])
    if @temple.destroy
      render json: {type: 'success', message: 'Temple successfully destroyed!'}, status: 200
    else
      render json: {type: 'Failed', message: 'Failed to destroyed!'}
    end
  end

  private

    def temple_params
      params.require(:temple).permit(:temple_name, :description, :temple_email, :phone_no, :temple_address, :city, :state, :country, :zipcode, :start_time, :end_time, :temple_images)
    end
end

