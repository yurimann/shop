class AddDeliveryApartmentNumberToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :delivery_apartment_number, :string
  end
end
