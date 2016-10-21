class LikesController < ApplicationController
before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @like = @prototype.likes.create(user_id: current_user.id)
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    @prototype = Prototype.find(params[:prototype_id])
  end
end


    #@like = current_user.likes.find_by(prototype_id: params[:id])
    #@like.destroy
    #@prototype = Prototype.find(params[:id])

#なにもいいねしていないところをおすとエンドレスでいいね増える
#一度赤くなっているところを再度押すことはできないインターナルサーバエラーが出る
