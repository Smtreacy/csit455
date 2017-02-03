class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :department, limit: 7
      t.string :name, limit: 50
      t.string :email, limit: 50
      t.string :password, limit: 255
      t.bool :admin

      t.timestamps
    end
  end
end
