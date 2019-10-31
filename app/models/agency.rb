class Agency < ApplicationRecord
  belongs_to :user
  belongs_to :address, optional: true
  accepts_nested_attributes_for :address # Creates a new address object within agency form
  has_many :listings
end
