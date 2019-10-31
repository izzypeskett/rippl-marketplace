class Skill < ApplicationRecord
  has_many :listings_skills
  has_many :listings, through: :listings_skills
  has_many :skills_volunteers
  has_many :volunteers, through: :skills_volunteers
end
