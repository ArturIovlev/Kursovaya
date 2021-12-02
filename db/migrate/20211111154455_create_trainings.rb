class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.string :type_of_prog
      t.string :style
      t.string :name
      t.text :prog

      t.timestamps
    end
  end
end
