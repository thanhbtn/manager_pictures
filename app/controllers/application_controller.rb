class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_locale
  before_filter :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

        
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password)}
  end


  def layout_by_resource
    if devise_controller?
      "layout_devise"
    else
      "application"
    end
  end

  def get_locale
    if session[:locale].nil?
      set_locale
    else
      I18n.locale = session[:locale]
    end
  end

  def set_locale
    I18n.default_locale = :vi
    I18n.locale = params[:locale] || I18n.default_locale 
    session[:locale] = I18n.locale
  end
  
  def check_current_user?

  end

  def redirect_login
    if current_user.nil? == true
      redirect_to new_user_session_path
    elsif params[:controller].to_s.eql?("users") && current_user.admin? == false
      redirect_to root_path
    else
      #nothing
    end
  end
end
