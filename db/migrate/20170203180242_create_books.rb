class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title, limit: 255
      t.string :author, limit: 255
      t.string :isbn, limit: 50
      t.integer :edition

      t.timestamps
    end
  end
end
