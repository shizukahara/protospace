class UsersController < ApplicationController

  def edit

  end

  def update
    current_user.update(update_params)
    redirect_to action: :show
  end

  def destroy

  end

  def show
    @user = User.find(params[:id])
    @prototypes = current_user.prototypes.order("created_at DESC")
  end



    private
    # Use callbacks to share common setup or constraints between actions.
    def set_avatar
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avatar_params
      params.require(:user).permit(:description, :avatar)
    end

    def update_params
      params.require(:user).permit(:image, :text, :avatar, :work, :private, :profile, :member)
    end

end

