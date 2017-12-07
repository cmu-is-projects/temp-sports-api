class UsersController < ApplicationController
  # API Documentation
  swagger_controller :users, "Users Management"

  # Show All Users
  swagger_api :index do
    summary "Shows all Users"
    notes "This lists all the users"
  end

  # Show a User
  swagger_api :show do
    summary "Shows one User"
    param :path, :id, :integer, :required, "User ID"
    notes "This lists details of one user"
    response :not_found
  end

  # Create a User
  swagger_api :create do
    summary "Creates a new User"
    param :form, :first_name, :string, :required, "First name"
    param :form, :last_name, :string, :required, "Last name"
    param :form, :team_id, :integer, :required, "Team ID"
    param :form, :password, :string, :required, "Password"
    param :form, :password_confirmation, :string, :required, "Password Confirmation"
    param :form, :studentClass, :string, :required, "Class"
    param :form, :major, :string, :required, "Major"
    param :form, :andrewID, :string, :required, "Andrew ID"
    response :not_acceptable
  end

  # Update a User
  swagger_api :update do
    summary "Updates an existing User"
    param :path, :id, :integer, :required, "User Id"
    param :form, :first_name, :string, :optional, "First name"
    param :form, :last_name, :string, :optional, "Last name"
    # param :form, :password, :string, :required, "Password"
    # param :form, :password_confirmation, :string, :required, "Password Confirmation"
    param :form, :studentClass, :string, :optional, "Class"
    param :form, :major, :string, :optional, "Major"
    param :form, :andrewID, :string, :optional, "Andrew ID"
    response :not_acceptable
  end

  # Delete a User
  swagger_api :destroy do
    summary "Deletes an existing User"
    param :path, :id, :integer, :required, "User Id"
    response :not_found
  end


  before_action :set_user , only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /user/1
  def show
      render json: @user
  end

  # POST /user
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
      # send back response saying confirmed created password through API
    else
      render json: @user.errors, status: :unprocessable_entity
      # send back response saying fields incorrect through API
    end
  end

  # PATCH /user/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /children/1
  def destroy
    @user.destroy
  end



  private
  def set_user
      @user = User.find(params[:id])
  end

  def user_params
    params.permit(:first_name, :last_name, :team_id,:password, :password_confirmation,:studentClass,:major,:andrewID)
  end


end
