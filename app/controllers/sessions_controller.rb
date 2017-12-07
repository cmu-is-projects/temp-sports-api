class SessionsController < ApplicationController
  # API Documentation
  swagger_controller :sessions, "Session Management"

  # Begin a Session (Login)
  swagger_api :create do
    summary "Takes in andrewID and password, returns user object if successful, error otherwise"
    param :form, :andrewID, :string, :required, "Andrew ID"
    param :form, :password, :string, :required, "Password"
    response :not_acceptable
  end


  # Ends a Session (Logout)
  swagger_api :destroy do
    summary "Ends the current session and logs out"
    response :not_found
  end


  def new
  end

  def create
    user = User.find_by_andrewID(params[:andrewID])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # Successful login => send back the users information
      render json: user, status: :created, location: user
    else
      # Failed login => send back the errors
      render json: {"login_failed" => true}, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {"logged_out" => true}
  end
end
