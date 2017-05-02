class UsersController < ApplicationController


  before_action :get_user, only: [:show, :edit]

  def show
    @user = User.find(params[:id])
    @prototypes = current_user.prototypes.order("created_at DESC").includes(:tags).page(params[:page]).per(8)
  end

  def edit

  end

  def update
    current_user.update(update_params)
    redirect_to action: :show

  end

  def destroy

  end

  # Use callbacks to share common setup or constraints between actions.
  # Never trust parameters from the scary internet, only allow the white list through.

  private
  def update_params
    params.require(:user).permit(:image, :text, :avatar, :work, :private, :profile, :member)
  end

  def get_user
    @user = User.find(params[:id])
  end

end

