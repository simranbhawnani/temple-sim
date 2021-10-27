class DevotersController < ApplicationController
  before_action :find_devoter, only: [:show, :update, :destroy]

  def index
  end

  def show
    render json: {type: 'success', devoter: @devoter}, status: 200
  end
  
  def new
    @devoter = Devoter.new
  end

  def create
    @devoter = Devoter.new(Devoter_params)
    if @devoter.save
      render json: {type: 'success', message: 'Devoter successfully created!',Devoter: @devoter}, status: 200
    else
      render json: {type: 'failed', message: 'Failed to create'}, status: 403
    end
  end

  # def edit
  #   @devoter = Devoter.find(params[:id])
  # end

  def update
    if @devoter.update(devoter_params)
      render json: {type: 'success', message: 'Update successfully'}, status: 200
    else
      render json: {type: 'failed', message: 'Failed to update!'}, status: 403
    end
  end

  def destroy
    if @devoter.destroy
      render json: {type: 'success', message: 'Successfully destroyed!'}, status: 200
    else
      render json: {type: 'failed', message: 'Failed to destroyed!'}, status: 403
    end
  end

  private

    def find_devoter
      @devoter = Devoter.find(params[:id])
    end

    def devoter_params
      params.require(:devoter).permit(:first_name, :last_name, :address, :mail_id, :contact, :id_proof, :proof_id_number, :temple_id)
    end
end
