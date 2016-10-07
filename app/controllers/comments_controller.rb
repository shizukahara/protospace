class CommentsController < ApplicationController

  def create
    @prototype = Prototype.includes(:user, :thumbnails).find(params[:prototype_id])
    @comment = current_user.comments.create(comment_params)
    @comments = @prototype.comments.includes(:user, :prototype)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(prototype_id: params[:prototype_id])
  end
end
