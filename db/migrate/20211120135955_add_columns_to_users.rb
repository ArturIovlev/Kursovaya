class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :current_mass, :float,:default => 0
    add_column :users, :allow_the_publication, :boolean, :default => false
    add_column :users, :first_training, :date
    add_column :users, :training_id, :integet
    add_column :users, :calories, :integer
    add_column :users, :weight_change, :float
    add_column :users, :num_of_trainings, :integer, :default => 0
    add_column :users, :num_of_completed, :integer, :default => 0
    add_column :users, :num_of_passes, :integer, :default => 0
  end
end
