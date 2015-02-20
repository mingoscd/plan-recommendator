class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :city
      t.string :address
      t.float :lat
      t.float :lon
      t.float :rate
      t.float :price
      t.integer :time
      t.string :wheather
      t.string :type_of_site
      t.timestamps null: false
      # things/suggest to add to the future model
      # preferences_to_satisfy
      # comments
    end
  end
end
