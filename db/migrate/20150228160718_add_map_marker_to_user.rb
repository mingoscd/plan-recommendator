class AddMapMarkerToUser < ActiveRecord::Migration
  def change
  	add_column :users, :marker, :string
  end
end
