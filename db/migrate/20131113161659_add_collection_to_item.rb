class AddCollectionToItem < ActiveRecord::Migration
  def change
    add_reference :items, :collection, index: true
  end
end
