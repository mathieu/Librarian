class CreateRoles < ActiveRecord::Migration
  def change

    # Create Role table
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end

    # Add role to user
    add_belongs_to :users, :role, index: true
  end
end
