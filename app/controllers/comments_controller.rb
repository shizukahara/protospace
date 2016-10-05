class CommentsController < ApplicationController
  before_action :set_prototype
  def create
    @comment = @prototype.comments.create(comment_params)
    @comments = @prototype.comments.includes(:user, :prototype)
  end

  private
  def set_prototype
    @prototype = Prototype.includes(:user, :thumbnails).find(params[:prototype_id])
  end

  def comment_params
    params.require(:comment).permit(:text, :user_id)
  end
end
