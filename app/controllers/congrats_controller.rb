class CongratsController < ApplicationController
  before_action :authenticate_user!
  def index
    redirect_to random_user_path if User.pick_random(current_user)
  end
end
