class UsersController < ApplicationController

#テストのbefore_action


  def show
    @user = User.find(params[:id])
    #@prototypes = current_user.prototypes.order("created_at DESC").includes(:tags).page(params[:page]).per(8)
    @prototypes = @user.prototypes
  end

  def edit

  end

  def update
    #current_user.update(update_params)
    @user.update(update_params)
    redirect_to action: :show
    #テスト用
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

