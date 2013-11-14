class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :author
      t.date :registered
      t.boolean :available

      t.timestamps
    end
  end
end
