class UsersController < ApplicationController

  def edit

  end

  def update

  end

  def destroy
    
  end

  def show
    @user = User.find(params[:id])
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

end

