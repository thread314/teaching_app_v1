class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :term_a
      t.integer :term_b

      t.timestamps
    end
  end
end
