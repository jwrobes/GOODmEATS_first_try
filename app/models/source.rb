class Source < ActiveRecord::Base

  has_many :source_meats, inverse_of: :source
  has_many :meats, through: :source_meats
end
