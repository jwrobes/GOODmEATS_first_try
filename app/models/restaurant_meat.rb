class RestaurantMeat < ActiveRecord::Base

  belongs_to :restaurant, inverse_of: :restaurant_meats
  belongs_to :source_meat, inverse_of: :restaurant_meats

end
