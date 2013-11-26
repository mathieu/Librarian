class AddEditorToComic < ActiveRecord::Migration
  def change
    add_column :items, :editor, :string
  end
end
