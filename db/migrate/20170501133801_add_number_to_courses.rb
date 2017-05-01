class AddNumberToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :course_number, :integer
  end
end
