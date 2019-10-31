# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  def destroy
    super
    flash.delete(:notice)
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def after_sign_in_path_for(resource)
    id = resource.id
    if resource.is_agency == true
      agency = Agency.find_by_user_id(id)
      show_agency_path(agency)
    else 
      volunteer = Volunteer.find_by_user_id(id)
      show_volunteer_path(volunteer)
    end
  end
end
