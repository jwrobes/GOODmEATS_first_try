class Restaurant < ActiveRecord::Base

	validates_presence_of :name, :foursquare_id, :latitude, :longitude, :location
	validates_uniqueness_of :foursquare_id

	has_many :restaurantmeats
	has_many :meats, through: :restaurantmeats

	has_many :sources, source: :source, through: :sourcemeats

	def index
		
	end

end