class ListingvolunteersController < ApplicationController
before_action :authenticate_user!

  def index
    @listing = Listing.find(params[:id])
    @agency = current_user.agencies.first
  end

end