class Volunteer < ApplicationRecord
  belongs_to :user
  enum gender: { female: 0, male: 1, unspecified: 3 }
  has_one_attached :photo
  has_one_attached :resume
  has_many :skills_volunteers
  has_many :skills, through: :skills_volunteers

  has_many :listing_volunteers
  has_many :listings, through: :listing_volunteers
end
