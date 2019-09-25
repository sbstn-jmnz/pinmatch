class PrivateMessagesController < ApplicationController
  def new
    
    @all_messages = PrivateMessage.where(sender_id: [current_user.id, params[:id]], receiver_id: [params[:id], current_user.id])
    @pm = PrivateMessage.create(sender_id: current_user.id, receiver_id: params[:id])
  end

  def update
    @pm = PrivateMessage.find(params[:id])
    @pm.content = params[:private_message][:content]
    @pm.save
    redirect_to new_pm_path(@pm.receiver_id)
  end
end
