class WorshipsController < ApplicationController
  
  def show
    @worship = Worship.find(params[:id])
    render json: {type: 'success', temple_history_detail: @worship}, status: 200
  end

  def new
    @worship = Worship.new
  end

  def create
    @worship = Worship.new(worship_params)
    if @worship.save
      render json: {type: 'success', message: 'Successfully created!',worship: @worship}, status: 200
    else
      flash[:error] = 'Falied to create!'
      redirect_back(fallback_location: new_worship_path)
    end
  end

  def update
    @worship = Worship.find(params[:id])
    if @worship.update(worship_params)
      render json: {type: 'success', message: 'Update successfully', worship: @worship}, status: 200
    else
      flash[:error] = @worship.errors.messages
      redirect_back(fallback_location: worships_path)
    end
  end

  def destroy
    @worship = Worship.find(params[:id])
    if @worship.destroy
      render json: {type: 'success', message: 'Successfully destroyed!'}, status: 200
    else
      render json: {type: 'Failed', message: 'Failed to destroyed!'}
    end
  end

  private

    def worship_params
      params.require(:worship).permit(:name, :type_of_pooja, :pundit, :start_time, :end_time, :temple_id)
    end
end
