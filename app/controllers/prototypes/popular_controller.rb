class Prototypes::PopularController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user, :thumbnails, :tags).order('likes_count DESC')
    render "prototypes/index"
  end
end
