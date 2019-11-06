class PagesController < ApplicationController

  def home
    @listings = Listing.last(5).reverse
    if user_signed_in?
      if current_user.is_agency == true
        @agency = current_user.agencies.first
      else
        @volunteer = current_user.volunteers.first
      end
    end
  end

end
