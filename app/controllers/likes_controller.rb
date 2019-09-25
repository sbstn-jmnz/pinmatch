class LikesController < ApplicationController
  def update
    interaction = Interaction.update(params[:id], like: true)
    match = Interaction.where(receiver_id: current_user.id, giver_id: interaction.receiver.id, like: true)
    if match.length.positive?
      redirect_to new_pm_path(interaction.receiver.id), notice: 'yujuuu tienes un match'
    else
      redirect_to random_user_path
    end
  end
end
