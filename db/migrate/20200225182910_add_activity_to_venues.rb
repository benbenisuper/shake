class AddActivityToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :activity, :string
  end
end
