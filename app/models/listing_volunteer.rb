class ListingVolunteer < ApplicationRecord
  belongs_to :listing
  belongs_to :volunteer
  belongs_to :listing_outcome
end
