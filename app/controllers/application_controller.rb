# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Devise helper method for controlling where you go after signing in (by default it's the root_url)
  def after_sign_in_path_for(resource)
    comfy_admin_cms_path
  end
end
