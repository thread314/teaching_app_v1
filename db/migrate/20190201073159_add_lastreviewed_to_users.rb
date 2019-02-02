class AddLastreviewedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lastreviewed, :date
  end
end
