# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    if session[:path].include? "agency"
      # stored_location_for(:user).include? "agency"
      @is_agency = true 
    else
      @is_agency = false
    end
    super
  end

  # POST /resource
  def create
    super
    if session[:path].include? "agency"
    @user.is_agency = true
    agency = resource.agencies.build(name: params[:user][:agency][:name], description: params[:user][:agency][:description], address_id: params[:user][:agency][:address_attributes][:id])
    # address = resource.agencies.last.address.build( number: params[:user][:agency][:address_attributes][:number], street: params[:user][:agency][:address_attributes][:street], city: params[:user][:agency][:address_attributes][:city], state: params[:user][:agency][:address_attributes][:state], postcode: params[:user][:agency][:address_attributes][:postcode])
    agency.save
    else
      @user.is_agency = false
      volunteer = resource.volunteer.build(name: params[:user][:volunteer][:name], photo: params[:user][:volunteer][:photo], age: params[:user][:volunteer][:age], gender: params[:user][:volunteer][:gender], resume: params[:user][:volunteer][:resume])
      volunteer.save
      byebug
    end
    @user.save
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # def set_agency_user
  #   @user.agencies.new(params[:user][:agency])
  #   @user.agencies.address.new(params[:user][:agency][:address_attributes])
  #   byebug
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [agencies_attributes:[:id, :name, :description]][volunteers_attributes:[:name, :photo, :age, :gender, :resume]])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
