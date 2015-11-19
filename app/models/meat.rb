class Meat < ActiveRecord::Base

  has_many :source_meats, inverse_of: :meat
  # has_many :restaurant_meats, inverse_of: :meat
  # has_many :restaurants, through: :restaurants_meats
  has_many :sources, through: :source_meats
end
