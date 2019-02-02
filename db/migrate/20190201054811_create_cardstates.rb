class CreateCardstates < ActiveRecord::Migration[5.2]
  def change
    create_table :cardstates do |t|
      t.integer :user_id
      t.integer :card_id
      t.float :delay
      t.date :due

      t.timestamps
    end
  end
end
