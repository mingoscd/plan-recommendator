class Place < ActiveRecord::Base
	validates :name, uniqueness: true, presence: true
	validates :city, :type_of_site, presence: true
	validates :price, :rate, :time, allow_nil: true, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
	#validates :lat, :lon, :weather, allow_blank: true

	validates :address, presence: true, if: "lat.blank? && lon.blank?"
	validates :lat, :lon, presence: true, if: "address.blank?"
	
	validates :lat, numericality: { greater_than_or_equal_to: -90,  \
  less_than_or_equal_to: 90 }, allow_blank: true
	validates :lon, numericality: { greater_than_or_equal_to: -180,  \
  less_than_or_equal_to: 180 }, allow_blank: true
end
