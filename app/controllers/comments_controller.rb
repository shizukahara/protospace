class CommentsController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id])
    current_user.comments.create(comment_params)
    @comments = Comment.where(prototype_id: @prototype)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(prototype_id: params[:prototype_id])
  end
end
