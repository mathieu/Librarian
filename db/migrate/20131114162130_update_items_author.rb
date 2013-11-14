class UpdateItemsAuthor < ActiveRecord::Migration
  def change
    remove_column :items, :author
    add_column :items, :author_names, :string
  end
end
