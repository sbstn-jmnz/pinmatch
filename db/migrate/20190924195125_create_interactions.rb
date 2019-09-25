class CreateInteractions < ActiveRecord::Migration[5.2]
  def change
    create_table :interactions do |t|
      t.references :giver, foreign_key: false
      t.references :receiver, foreign_key: false

      t.timestamps
    end
    # Rails 5+ only: add foreign keys
    add_foreign_key :interactions, :users, column: :giver_id, primary_key: :id
    add_foreign_key :interactions, :users, column: :receiver_id, primary_key: :id
  end
end
