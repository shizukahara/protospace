class PrototypesController < ApplicationController

  
  def index
    
  end



  def move_to_index
     redirect_to action: :index unless user_signed_in?
  end
end
