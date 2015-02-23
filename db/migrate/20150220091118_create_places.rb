class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :city
      t.string :address
      t.decimal :lat
      t.decimal :lon
      t.float :rate
      t.float :price
      t.string :currency
      t.integer :time
      t.string :weather
      t.string :type_of_site
      t.timestamps null: false
      # things/suggest to add to the future model
      # preferences_to_satisfy
      # comments
    end
  end
end
