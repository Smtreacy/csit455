class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.references :teacher, foreign_key: true
      t.string :deptName, limit: 7
      t.text :name
      t.integer :section

      t.timestamps
    end
  end
end
