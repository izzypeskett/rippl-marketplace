class ListingvolunteersController < ApplicationController
before_action :authenticate_user!

before_action :check_agency

  def index
    @listing = Listing.find(params[:id])
    @agency = current_user.agencies.first
  end

  private

  def check_agency
    @listing = Listing.find(params[:id])
    @agency = current_user.agencies.first
    if @listing.agency_id == @agency.id
    else
      redirect_to :root 
    end
  end

end