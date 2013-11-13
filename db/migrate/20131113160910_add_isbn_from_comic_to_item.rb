class AddIsbnFromComicToItem < ActiveRecord::Migration
  def change
    add_column :items, :isbn, :string, limit: 13
    add_index :items, :isbn, unique: true
  end
end
