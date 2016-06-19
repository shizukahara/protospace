class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!, except: :index
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :success, :info, :warning, :danger

  def after_sign_out_path_for(resource)
    '/users/sign_in' # サインアウト後のリダイレクト先URL
  end

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up).push(:profile, :member, :topmedia, :nickname, :avatar, :work)
      devise_parameter_sanitizer.for(:account_update).push(:profile, :member, :topmedia, :nickname, :avatar, :work)
  end
end
