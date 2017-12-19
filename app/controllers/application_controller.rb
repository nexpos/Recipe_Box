class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :categories
  
  def categories
    @categories = Category.all
  end

  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :username, :image])
  end
end
