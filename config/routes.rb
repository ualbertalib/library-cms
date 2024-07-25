# frozen_string_literal: true

Rails.application.routes.draw do
  comfy_route :cms_admin, path: "/admin"

  match "/404", to: "errors#file_not_found", via: :all
  match "/422", to: "errors#unprocessable", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  # Ensure that this route is defined last
  comfy_route :cms, path: "/"
end
