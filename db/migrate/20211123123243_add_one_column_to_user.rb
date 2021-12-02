class AddOneColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :updat, :boolean, :default => false
  end
end
