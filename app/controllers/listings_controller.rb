class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_user_agency, except: [:index, :show]
  
  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = @agency.listings.new( listing_params )
    authorize @listing
    if @listing.save
      redirect_to @listing
    else 
      flash.now[:alert] = "Uh-oh, your wave was unsuccessfully created."
      render :new
    end
  end

  def show
    @listing = Listing.find(params[:id])
    if user_signed_in?
      if current_user.is_agency == false
        @volunteer = current_user.volunteers.first
      else
      end
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def apply
    byebug
    id = params[:id]
    @listing = Listing.find_by_id(id)
    @volunteer = current_user.volunteers.first
    ListingVolunteer.create(listing_id: @listing.id, volunteer_id: @volunteer.id, listing_outcome_id:3)
  end

  def update
    @listing = Listing.find(params[:id])
    authorize @listing
    if @listing.update
      redirect_to @listing
    else
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    authorize @listing
    if @listing.destroy
      flash[:notice] = "\"#{@listing.title}\" was successfully deleted."
      redirect_to show_agency_path(@agency)
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :description, :time_frame, :time_required, :no_of_volunteers, :agency_id, skill_ids: [])
  end

  def set_user_agency
    @agency = current_user.agencies.first
  end


end
