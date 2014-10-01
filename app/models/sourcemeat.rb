class Sourcemeat < ActiveRecord::Base

	belongs_to :source
	belongs_to :meats
	has_many :restaurantmeats


end