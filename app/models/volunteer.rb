class Volunteer < ApplicationRecord
  belongs_to :user
  enum gender: { female: 0, male: 1, unspecified: 3 }

  has_one_attached :photo
  has_one_attached :resume
 

  has_many :skills_volunteers, dependent: :destroy
  has_many :skills, through: :skills_volunteers
  accepts_nested_attributes_for :skills

  has_many :listing_volunteers, dependent: :destroy
  has_many :listings, through: :listing_volunteers

  validates :name, presence: true
  validates :age, presence: true, numericality: { greater_than: 15, message: "You must be 16 years or above to volunteer" }
end
