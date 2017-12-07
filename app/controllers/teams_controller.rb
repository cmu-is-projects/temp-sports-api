class TeamsController < ApplicationController
  # API Documentation
  swagger_controller :teams, "Teams Management"

  # Show All Teams
  swagger_api :index do
    summary "Shows all Teams"
    notes "This lists all the teams"
  end

  # Show a Team
  swagger_api :show do
    summary "Shows one Team"
    param :path, :id, :integer, :required, "Team ID"
    notes "This lists details of one team"
    response :not_found
  end

  # Create a Team
  swagger_api :create do
    summary "Creates a new Team"
    param :form, :name, :string, :required, "Team name"
    param :form, :gender, :string, :required, "Gender"
    param :form, :season, :string, :required, "Season"
    response :not_acceptable
  end

  # Update a Team
  swagger_api :update do
    summary "Updates an existing Team"
    param :path, :id, :integer, :required, "Team Id"
    param :form, :name, :string, :optional, "Team name"
    param :form, :gender, :string, :optional, "Gender"
    param :form, :season, :string, :optional, "Season"
    response :not_acceptable
  end

  # Delete a Team
  swagger_api :destroy do
    summary "Deletes an existing Team"
    param :path, :id, :integer, :required, "Team Id"
    response :not_found
  end



  before_action :set_user , only: [:show, :update, :destroy]

  # GET /teams
  def index
    @teams = Team.all

    render json: @teams
  end

  # GET /team/1
  def show
      render json: @team
  end

  # POST /team
  def create
    @team = Team.new(team_params)
    if @team.save
      render json: @team, status: :created, location: @team
    else
      render json: @team.errors, status: :unprocessable_entity
      # send back response saying fields incorrect through API
    end
  end

  # PATCH /team/1
  def update
    if @team.update(team_params)
      render json: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
  end



  private
  def set_team
      @team = Team.find(params[:id])
  end

  def team_params
    params.permit(:name, :gender, :season)
  end


end
