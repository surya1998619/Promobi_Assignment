class AddColumnsToTutors < ActiveRecord::Migration[7.0]
  def change
    add_column :tutors, :age, :integer
    add_column :tutors, :gender, :string
    add_column :tutors, :experience, :string
  end
end
