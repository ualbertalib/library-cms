# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :admins
  end

  root controller: "comfy/cms/content", cms_path: "", action: "show"

  devise_for :admins
  comfy_route :cms_admin, path: "/admin"

  get "/staff", to: redirect("https://guides.library.ualberta.ca/az/library-staff-directory")

  match "/404", to: "errors#file_not_found", via: :all
  match "/422", to: "errors#unprocessable", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  # Ensure that this route is defined last
  comfy_route :cms, path: "/"
end
