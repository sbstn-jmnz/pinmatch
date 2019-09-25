class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_interactions, class_name: 'Interaction', foreign_key: 'giver_id'
  has_many :received_interactions, class_name: 'Interaction', foreign_key: 'receiver_id'
  has_many :sent_messages, class_name: 'PrivateMessage', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'PrivateMessage', foreign_key: 'receiver_id'

  def self.pick_random(user)
    interactions_ids = Interaction.where(giver_id: user.id).pluck(:receiver_id)
    random_id = (pluck(:id) - [user.id] - interactions_ids).sample
    random_id ? find(random_id) : nil
  end
end
