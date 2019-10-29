class Volunteer < ApplicationRecord
  belongs_to :user
  enum gender: { female: 0, male: 1, unspecified: 3 }
  has_one_attached :photo
  has_one_attached :resume
end
