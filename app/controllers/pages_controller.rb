class PagesController < ApplicationController

  def home
    @agencies = Agency.all
    @listings = Listing.all
  end

  def agency
  end
end
