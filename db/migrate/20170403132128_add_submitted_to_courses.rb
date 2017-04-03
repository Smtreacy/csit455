class AddSubmittedToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :submitted, :boolean
  end
end
