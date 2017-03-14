class Prototypes::NewestController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user, :thumbnails, :tags).order('created_at DESC').page(params[:page]).per(8)
    render "prototypes/index"
  end
end
