# frozen_string_literal: true

class Users::RegistrationsController < ApplicationController
  # before_action :current_user, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  skip_before_action :verify_authenticity_token

  def create
    if current_user
      user = User.new(user_params)
      user.save ? (render json: user) : (render json: user.errors)
    else
      render :json => {:message => "You Have Not Authorised !"}
    end
  end 

  def current_user
    @current_user ||= User.find_by(authentication_token: request.headers['Authorization'])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :zipcode, :contact, :id_proof, :proof_id_number, :role, :active_status, :temple_id, :email, :authentication_token, :password) 
  end

end
