class AddPriceToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :price, :integer, default: 1, null: false
  end
end
