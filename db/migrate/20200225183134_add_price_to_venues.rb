class AddPriceToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :price, :integer, default: 1, null: false
  end
end
