class Listing < ApplicationRecord
  belongs_to :address, optional: true
  belongs_to :agency
  accepts_nested_attributes_for :address
  has_many :listings_skills
  has_many :skills, through: :listings_skills
  accepts_nested_attributes_for :skills

  has_many :listing_volunteers, dependent: :destroy
  has_many :volunteers, through: :listing_volunteers

  validates :title, presence: true, length: { in: 10..250 }
  validates :description, presence: true, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }
end
