class PrototypesController < ApplicationController
  before_action :move_to_index, except: :index
  before_action :setting_prototype, only: [:edit, :show, :update, :destroy]

  def index
    @prototypes = Prototype.includes(:user, :thumbnails).order('created_at DESC')
  end

  def show
    @thumbnails = @prototype.thumbnails.sub
    @user = @prototype.user
    @comment = Comment.new(prototype_id: @prototype_id)
    @comments = @prototype.comments.includes(:user)
    @like  = @prototype.likes.find_by(user_id: current_user.id)
  end

  def new
    @prototype = Prototype.new
    @prototype.thumbnails.build
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: 'The page was uploaded'
    else
      redirect_to new_prototype_path, alert: 'Please retry'
    end
  end

  def edit
    @main_image = @prototype.thumbnails.main
    @sub_images = @prototype.thumbnails.sub
  end

  def update
    @prototype.update(prototype_params) if @prototype.user_id == current_user.id
    redirect_to action: :index
  end

  def destroy
    @prototype.destroy if @prototype.user_id == current_user.id
    redirect_to action: :index
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
    )
  end

  def setting_prototype
    @prototype = Prototype.find(params[:id])
  end


end
