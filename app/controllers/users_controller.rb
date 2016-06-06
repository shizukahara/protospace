class UsersController < ApplicationController

  def edit

  end

  def update

  end

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up).push(:profile, :member, :topmedia, :nickname, :avatar, :work)
      devise_parameter_sanitizer.for(:account_update).push(:profile, :member, :topmedia, :nickname, :avatar, :work)
  end
end
