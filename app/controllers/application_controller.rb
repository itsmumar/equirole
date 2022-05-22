class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :email, :number, :password, :password_confirmation, :current_password])
  end

  private

  def authorize_page
    @day_limit = 250
    unless current_user
      flash[:notice] = "You must be logged in to access this page."
      redirect_to '/users/sign_in'
    end
  end
end
