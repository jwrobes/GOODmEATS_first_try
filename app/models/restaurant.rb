class Restaurant < ActiveRecord::Base

  has_many :restaurant_meats
  has_many :source_meats, through: :restaurant_meats, inverse_of: :restaurants
  accepts_nested_attributes_for :restaurant_meats, allow_destroy: true

end
