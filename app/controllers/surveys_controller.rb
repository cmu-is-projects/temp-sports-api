class SurveysController < ApplicationController
  # API Documentation
  swagger_controller :surveys, "Survey Management"

  # Show all Surveys
  swagger_api :index do
    summary "Fetches all Surveys"
    notes "This lists all the surveys"
  end

  # Show a Survey
  swagger_api :show do
    summary "Shows one survey"
    param :path, :id, :integer, :required, "Survey ID"
    notes "This lists details of one survey"
    response :not_found
  end

  # Create a Survey
  swagger_api :create do
    summary "Creates a new Survey"
    param :form, :survey_type, :string, :required, "Survey Type"
    param :form, :user_id, :string, :required, "User ID"
    param :form, :response, :string, :required, "Survey Response"
    response :not_acceptable
  end

  # Update a Survey
  swagger_api :update do
    summary "Updates an existing Survey"
    param :path, :id, :integer, :required, "Survey Id"
    param :form, :survey_type, :integer, :required, "Survey Type"
    param :form, :user_id, :integer, :optional, "User Id"
    param :form, :response, :string, :option, "Survey Response"
    response :not_acceptable
  end

  # Delete a Survey
  swagger_api :destroy do
    summary "Deletes an existing Survey"
    param :path, :id, :integer, :required, "Survey Id"
    response :not_found
  end


  before_action :set_survey , only: [:show, :update, :destroy]

  # GET /surveys
  def index
    @surveys = Survey.all

    render json: @surveys
  end

  # GET /survey/1
  def show
      render json: @survey
  end

  # POST /survey
  def create
    @survey = Survey.new(survey_params)
    @survey.completed_on = Time.now
    # we need to validate survey in the model
    if @survey.save
      render json: @survey, status: :created, location: @survey
      # send back response saying confirmed created password through API
    else
      render json: @survey.errors, status: :unprocessable_entity
      # send back response saying fields incorrect through API
    end
  end

  # PATCH /survey/1
  def update
    if @survey.update(survey_params)
      render json: @survey
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  # DELETE /surveys/1
  def destroy
    @survey.destroy
  end



  private
  def set_survey
      @survey = survey.find(params[:id])
  end

  def survey_params
    params.permit(:survey_type, :response, :user_id)
  end


end
