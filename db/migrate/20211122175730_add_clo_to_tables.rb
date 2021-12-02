class AddCloToTables < ActiveRecord::Migration[6.0]
  def change
    add_column :trainings, :times_week, :integer
    add_column :users, :skip, :boolean, :default => false
    add_column :users, :date_of_change, :date
  end
end
