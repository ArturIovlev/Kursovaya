class AddColumnsToTrainings < ActiveRecord::Migration[6.0]
  def change
      add_column :trainings, :prog1, :text
      add_column :trainings, :prog2, :text
      add_column :trainings, :prog3, :text
      add_column :trainings, :prog4, :text
      add_column :trainings, :prog5, :text
      add_column :trainings, :prog6, :text
  end
end
