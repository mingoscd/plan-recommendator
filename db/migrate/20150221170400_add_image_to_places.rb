class AddImageToPlaces < ActiveRecord::Migration
  def self.up
    add_attachment :places, :photo
  end

  def self.down
    remove_attachment :places, :photo
  end
end
