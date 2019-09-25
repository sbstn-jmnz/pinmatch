class MatchesController < ApplicationController
  def index
    given = Interaction.where(giver_id: current_user.id, like: true).pluck(:receiver_id)
    @matches = Interaction.where(receiver_id: current_user.id, giver_id: given)
  end
end
