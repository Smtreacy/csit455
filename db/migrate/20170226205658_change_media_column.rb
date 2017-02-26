class ChangeMediaColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :media, :book_id_id, :book_id
  end
end
