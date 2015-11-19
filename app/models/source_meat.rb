class SourceMeat < ActiveRecord::Base

  belongs_to :source, inverse_of: :source_meats
  belongs_to :meat, inverse_of: :source_meats
  has_many :restaurant_meats, inverse_of: :source_meat
  has_many :restaurants, through: :restaurant_meats, inverse_of: :source_meats

end
