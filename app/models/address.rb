class Address < ApplicationRecord
  has_one :agency
  has_one :listing
end
