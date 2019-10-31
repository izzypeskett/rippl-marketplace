class ListingsSkill < ApplicationRecord
  belongs_to :listing
  belongs_to :skill
end