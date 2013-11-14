class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name

      t.timestamps
    end

    create_table :authors_items do |t|
      t.belongs_to :item
      t.belongs_to :author
    end
  end
end
