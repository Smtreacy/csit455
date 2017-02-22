class ChangeTeacherColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :teachers, :password, :password_digest
  end
end
