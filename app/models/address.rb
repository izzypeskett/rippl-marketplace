class Address < ApplicationRecord
  has_one :agency
  has_one :listing

  self.state = %w[ACT, NSW, NT, QLD, SA, TAS, VIC, WA]
  validates :state, inclusion: state
  validates :postcode, length: { is: 4 }
end
