class PrototypesController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @prototypes = Prototype.includes(:user, :thumbnails).order('created_at DESC')
    @nickname = current_user.nickname
  end

  def new
    @prototype = Prototype.new
    @prototype.thumbnails.build
  end

  def create
    Prototype.create(prototype_params)
    redirect_to action: :index

  end

  def show
    @prototype = Prototype.find(params[:id])
    @prototypes = @prototype.thumbnails.sub
    @user = @prototype.user
  end


  private
  def move_to_index
     redirect_to action: :index unless user_signed_in?
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catchcopy,
      :concept,
      :user_id,
      :image_url,
      thumbnails_attributes: [:id, :status, :image_url]
      ).merge(user_id: current_user.id)
  end


end
