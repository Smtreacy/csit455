class CreateMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :media do |t|
      t.string :name, limit: 255
      t.string :author
      t.integer :edition
      t.string :isbn, limit: 50
      t.string :website, limit: 255
      t.references :book_id, foreign_key: true

      t.timestamps
    end
  end
end
