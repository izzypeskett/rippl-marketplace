class Address < ApplicationRecord
  has_one :agency
  has_one :listing

 
  validates :postcode, length: { is: 4 }
end
