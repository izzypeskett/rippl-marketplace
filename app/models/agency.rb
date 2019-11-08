class Agency < ApplicationRecord
  belongs_to :user
  belongs_to :address, optional: true
  accepts_nested_attributes_for :address # Creates a new address object within agency form
  has_many :listings, dependent: :destroy

  # validates :name, presence: true, uniqueness: true, length: { in: 2..250 }
  # validates :description, presence: true, length: { maximum: 500, too_long:"Sorry the description can only be a maximum of 500 characters"}

end
