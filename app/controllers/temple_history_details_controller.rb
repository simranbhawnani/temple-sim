class TempleHistoryDetailsController < ApplicationController

  def index
    @temple_history_details = TempleHistoryDetail.all
    render json: {temple_history_detail: @temple_history_detail}
  end

  def show
    @temple_history_detail = TempleHistoryDetail.find(params[:id])
    render json: {type: 'success', temple_history_detail: @temple_history_detail}, status: 200
  end

  def new
    @temple_history_detail = TempleHistoryDetail.new
  end

  def create
    @temple_history_detail = TempleHistoryDetail.new(temple_history_details_params)
    if @temple_history_detail.save
      render json: {type: 'success', message: 'Temple history successfully created!',temple_history_detail: @temple_history_detail}, status: 200
    else
      flash[:error] = 'Falied to create temple history!'
      redirect_back(fallback_location: new_temple_history_detail_path)
    end
  end

  def update
    @temple_history_detail = TempleHistoryDetail.find(params[:id])
    if @temple_history_detail.update(temple_history_details_params)
      render json: {type: 'success', message: 'Update successfully', temple_history_detail: @temple_history_detail}, status: 200
    else
      flash[:error] = @temple_history_detail.errors.messages
      redirect_back(fallback_location: temple_history_details_path)
    end
  end

  def destroy
    @temple_history_detail = TempleHistoryDetail.find(params[:id])
    if @temple_history_detail.destroy
      render json: {type: 'success', message: 'Temple history successfully destroyed!'}, status: 200
    else
      render json: {type: 'Failed', message: 'Failed to destroyed!'}
    end
  end

  private

    def temple_history_details_params
      params.require(:temple_history_detail).permit(:temple_history, :temple_structure, :inside_temple_theertham, :outside_temple_theertham, :temple_id, :temple_history_images, :temple_structure_images, :inside_temple_theertham_images, :outside_temple_theertham_images)
    end
end
