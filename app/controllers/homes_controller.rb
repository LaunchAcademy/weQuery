class HomesController < ApplicationController
  def index
    if current_user
      redirect_to sessions_path
    end
  end
end
