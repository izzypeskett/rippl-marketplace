class SkillsVolunteer < ApplicationRecord
  belongs_to :skill 
  belongs_to :volunteer
end