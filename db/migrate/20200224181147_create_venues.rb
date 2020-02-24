class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :location
      t.references :user, foreign_key: true
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
