class AgencyController < ApplicationController
  before_action :authenticate_user!, except: [:sign_up]
  before_action :is_user_agency, except: [:sign_up]
  before_action :set_user_agency, only: [:edit, :update, :show, :destroy]

  # Do I need this code?
  def index
    @agencies = current_user.agencies.all
  end

  # Grabs the session path name to direct which
    # sign up form needs to be rendered 
  def sign_up
    session[:path] = new_agency_path
    redirect_to new_user_registration_path
  end

  def new
    @agency = Agency.new
  end

  def create
    current_user.is_agency = true
    current_user.save
    @agency = current_user.agencies.create( agency_params )
    if @agency.save!
    redirect_to show_agency_path(@agency)
    end
  end

  def show
    id = params[:id]
    @agency = Agency.find(id)
    authorize @agency
    @listings = @agency.listings
  end


  def edit
    id = params[:id]
    @agency = Agency.find(id)
    authorize @agency
  end

  def update
    id = params[:id]
    @agency = Agency.find(id)
    if @agency.update
      redirect_to @agency
    end
  end

  def destroy
    id = params[:id]
    @agency = Agency.find(id)
    authorize @agency
    current_user.destroy
    redirect_to :root
  end

  private
   
  def agency_params
   params.require(:agency).permit(:name, :description, address_attributes: [ :number, :street, :city, :state, :postcode] ) 
  end

  def is_user_agency
    if current_user.is_agency? == false
      redirect_to :root
    end
  end

  def set_user_agency
    id = params[:id]
    if current_user.is_agency? == true
      @agency = current_user.agencies.find_by_id(id)
    else @agency == nil
      redirect_to :root
    end
  end

end

