# frozen_string_literal: true

require "test_helper"

class CmsAdminTest < ActionDispatch::IntegrationTest
  test "/admin url" do
    get comfy_admin_cms_path,
      headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(Rails.application.secrets.cms_user, Rails.application.secrets.cms_password)}

    assert_response :redirect
    assert_redirected_to comfy_admin_cms_site_pages_path(site_id: Comfy::Cms::Site.first)
  end

  test "admin site" do
    get comfy_admin_cms_sites_path,
      headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(Rails.application.secrets.cms_user, Rails.application.secrets.cms_password)}

    assert_response :success
    assert_select "h2", "Sites"
  end

  test "admin site pages" do
    get comfy_admin_cms_site_pages_path(site_id: Comfy::Cms::Site.first),
      headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(Rails.application.secrets.cms_user, Rails.application.secrets.cms_password)}

    assert_response :success
    assert_select "h2", "Pages"
  end

  test "admin site layouts" do
    get comfy_admin_cms_site_layouts_path(site_id: Comfy::Cms::Site.first),
      headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(Rails.application.secrets.cms_user, Rails.application.secrets.cms_password)}

    assert_response :success
    assert_select "h2", "Layouts"
  end

  test "admin site snippets" do
    get comfy_admin_cms_site_snippets_path(site_id: Comfy::Cms::Site.first),
      headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(Rails.application.secrets.cms_user, Rails.application.secrets.cms_password)}

    assert_response :success
    assert_select "h2", "Snippets"
  end

  test "admin site files" do
    get comfy_admin_cms_site_files_path(site_id: Comfy::Cms::Site.first),
      headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(Rails.application.secrets.cms_user, Rails.application.secrets.cms_password)}

    assert_response :success
    assert_select "h2", "Files"
  end
end
