class AddFormdetailsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :surname, :string
    add_column :orders, :telephone, :string
    add_column :orders, :city, :string
    add_column :orders, :delivery_type, :string
  end
end
