class AddLikeToInteractions < ActiveRecord::Migration[5.2]
  def change
    add_column :interactions, :like, :boolean, default: false
  end
end
