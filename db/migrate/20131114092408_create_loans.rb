class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.references :user, index: true
      t.boolean :returned
      t.references :item, index: true

      t.timestamps
    end
  end
end
