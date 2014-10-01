class Meat < ActiveRecord::Base

	has_many :restaurantmeats
	has_many :restaurants, through: :restaurantmeats


end