class Restaurantmeat < ActiveRecord::Base

	belongs_to :meat
	belongs_to :restaurant


end