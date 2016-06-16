class PrototypesController < ApplicationController
  before_action :move_to_index, except: :index
  
  def index
    @prototypes = Prototype.all.order('id ASC')
  end

  def new
   @prototype = Prototype.new
   3.times { @prototype.thumbnails.build }
  end

  def create
    Prototype.create(prototype_params)
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
      ).merge(user_id: current_user.id)
  end


end
