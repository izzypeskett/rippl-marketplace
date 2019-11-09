Rails.application.routes.draw do

delete "/user/:id", to: "users/registrations#destroy", as: "destroy_user"
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  

  get "/", to: "pages#home", as: "root"

  # Agency routes
  get "/agency", to: "agency#index", as: "agencies"
  get "/agency/sign_up", to: "agency#sign_up", as: "sign_up_agency"
  post "/agency", to: "agency#create", as: "create_agency"
  get "/agency/new", to: "agency#new", as: "new_agency"
  get "/agency/:id", to: "agency#show", as: "show_agency"
  get "/agency/:id/edit", to: "agency#edit", as: "edit_agency"
  put "/agency/:id", to: "agency#update", as: "update_agency"
  patch "/agency/:id", to: "agency#update"
  delete "/agency/:id", to: "agency#destroy", as: "destroy_agency"
  

  # Volunteer routes
  get "/volunteer", to: "volunteers#index", as: "volunteers"
  get "/volunteer/sign_up", to: "volunteers#sign_up", as: "sign_up_volunteer"
  post "/volunteer", to: "volunteers#create", as: "create_volunteer"
  get "/volunteer/new", to: "volunteers#new", as: "new_volunteer"
  get "/volunteer/:id", to: "volunteers#show", as: "show_volunteer"
  put "/volunteer/:id", to: "volunteers#update"
  patch "/volunteer/:id", to: "volunteers#update"
  delete "/volunteer/:id", to: "volunteers#destroy", as: "destroy_volunteer"
  get "/volunteer/:id/edit", to: "volunteers#edit", as: "edit_volunteer"

  resources :listings

  get "/listings/:id/apply", to: "listings#apply", as: "apply_listing"

  get "/listing/:id/applicants", to: "listingvolunteers#index", as: "listing_applicant"
  

end
