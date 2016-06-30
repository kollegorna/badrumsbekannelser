class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource

  before_action :basic_auth if ENV['BASIC_AUTH'].eql? 'enabled'

  protected

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end

  def after_sign_in_path_for(resource)
    case resource
    when AdminUser
      admin_dashboard_path
    when User
      confessions_path
    end
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USERNAME'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
