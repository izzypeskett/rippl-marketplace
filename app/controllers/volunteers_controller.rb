class VolunteersController < ApplicationController
  before_action :authenticate_user!, except: [:sign_up]
  before_action :is_user_volunteer, except: [:sign_up]
  before_action :set_volunteer, only: [:edit, :update, :show, :destroy]

  def index
  end

  def sign_up
    session[:path] = new_volunteer_path
    redirect_to new_user_registration_path
  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = current_user.volunteers.create( volunteer_params )
    if @volunteer.save
      redirect_to show_volunteer_path(@volunteer)
    end
  end

  def show
    id = params[:id]
    @volunteer = Volunteer.find(id)
  end

  def edit
    id = params[:id]
    @volunteer = Volunteer.find(id)
  end

  def update
    id = params[:id]
    @volunteer = Volunteer.find(id)
    if @volunteer.update
      redirect_to @volunteer
    end
  end

  def destroy
    id = params[:id]
    @volunteer = Volunteer.find(id)
    @volunteer.destroy
    redirect_to :root
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:name, :photo, :age, :gender, :resume, skill_ids: [])
  end

  def is_user_volunteer
    if current_user.is_agency? == true
      redirect_to :root
    end
  end

  def set_volunteer
    id = params[:id]
    if current_user.is_agency? == false
      @volunteer = current_user.volunteers.find_by_id(id)
    else @volunteer == nil
      redirect_to new_volunteer_path
  end
end

end
