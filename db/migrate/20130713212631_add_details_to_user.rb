class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :telephone, :string
    add_column :users, :city, :string
    add_column :users, :address, :string
  end
end
