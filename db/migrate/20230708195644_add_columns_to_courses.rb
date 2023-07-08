class AddColumnsToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :difficulty, :string
    add_column :courses, :duration, :string
    add_column :courses, :cost, :string
  end
end
