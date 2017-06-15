class AddBillingAddressToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :apartment_number, :string
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :postal_code, :string
    add_column :users, :delivery_street, :string
    add_column :users, :delivery_city, :string
    add_column :users, :delivery_postal_code, :string
    add_column :users, :contact, :string
    add_column :users, :notes, :text
  end
end
