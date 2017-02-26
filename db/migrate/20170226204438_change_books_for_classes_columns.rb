class ChangeBooksForClassesColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :books_for_classes, :book_id_id, :book_id
    rename_column :books_for_classes, :course_id_id, :course_id
  end
end
