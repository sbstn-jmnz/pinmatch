class RandomUserController < ApplicationController
  before_action :authenticate_user!
  def new
    @random_user = User.pick_random(current_user)
    @interaction = Interaction.create(giver_id: current_user.id, receiver_id: @random_user.id)
  end
end
