class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_interactions, class_name: 'Interaction', foreign_key: 'giver_id'
  has_many :received_interactions, class_name: 'Interaction', foreign_key: 'receiver_id'

  def self.pick_random(user)
    random_user = order(Arel.sql('random()')).first
    pick_random(user) if random_user.id == user.id
    random_user
  end
end
