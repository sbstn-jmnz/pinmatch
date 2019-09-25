class CreatePrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :private_messages do |t|
      t.references :sender, foreign_key: false
      t.references :receiver, foreign_key: false
      t.string :content

      t.timestamps
    end
    # Rails 5+ only: add foreign keys
    add_foreign_key :private_messages, :users, column: :sender_id, primary_key: :id
    add_foreign_key :private_messages, :users, column: :receiver_id, primary_key: :id
  end
end
