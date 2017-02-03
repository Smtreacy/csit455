class CreateBooksForClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :books_for_classes do |t|
      t.references :book_id, foreign_key: true
      t.references :course_id, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
