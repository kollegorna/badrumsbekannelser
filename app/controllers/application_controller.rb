class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource

  if Rails.env.production? && ENV['BASIC_AUTH']
    http_basic_authenticate_with(
      name: ENV['BASIC_AUTH_USERNAME'],
      password: ENV['BASIC_AUTH_PASSWORD']
    )
  end

  protected

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end

  def after_sign_in_path_for(_resource)
    confessions_path
  end
end
