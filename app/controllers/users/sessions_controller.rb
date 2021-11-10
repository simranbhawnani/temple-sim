# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # skip_before_action :verify_authenticity_token
  # before_action :configure_sign_in_params, only: [:create]

  # def new
  #   # render "users/new"
  # super
  # end

  # def create
  #   super
  # end
  
  def destroy
    super
    # if current_user 
    #   current_user.authentication_token = nil 
    #   current_user.save
    #   render :json => {:message => "you have succesfully logged out"}
    # else
    #   render :json => {:message => "you have succesfully logged out"}
    # end    
  end
  
  # def if_an_active_employee
  #   if @user.active_status
  #     render json: @user.as_json
  #   else
  #     render :json => {:message => "not an active employee"}
  #   end
  # end

end


