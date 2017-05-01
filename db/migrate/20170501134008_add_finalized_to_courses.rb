class AddFinalizedToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :finalized, :boolean
  end
end
