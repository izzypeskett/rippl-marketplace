class Agency < ApplicationRecord
  belongs_to :address
  accepts_nested_attributes_for :address # Creates a new address object within agency form
  belongs_to :user
end
