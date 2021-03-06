class ApplicationController < ActionController::API
  include ActionController::Helpers

  # Methods to use in all controllers for authentication
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def logged_in?
    current_user
  end
  helper_method :logged_in?




end
