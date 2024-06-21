# frozen_string_literal: true

require "test_helper"

class CmsAdminTest < ActionDispatch::IntegrationTest
  test "unauthorized access to admin gets unauthorized response" do
    get comfy_admin_cms_path

    assert_response :unauthorized
  end

  test "/admin redirects to first site's pages index" do
    get comfy_admin_cms_path, headers: admin_authorization_headers

    assert_response :redirect
    assert_redirected_to comfy_admin_cms_site_pages_path(site_id: Comfy::Cms::Site.first)
  end

  test "admin sites index" do
    get comfy_admin_cms_sites_path, headers: admin_authorization_headers

    assert_response :success
    assert_select "h2", "Sites"
  end

  test "admin site pages index" do
    get comfy_admin_cms_site_pages_path(site_id: Comfy::Cms::Site.first), headers: admin_authorization_headers

    assert_response :success
    assert_select "h2", "Pages"
  end

  test "admin site layouts index" do
    get comfy_admin_cms_site_layouts_path(site_id: Comfy::Cms::Site.first), headers: admin_authorization_headers

    assert_response :success
    assert_select "h2", "Layouts"
  end

  test "admin site snippets index" do
    get comfy_admin_cms_site_snippets_path(site_id: Comfy::Cms::Site.first), headers: admin_authorization_headers

    assert_response :success
    assert_select "h2", "Snippets"
  end

  test "admin site files index" do
    get comfy_admin_cms_site_files_path(site_id: Comfy::Cms::Site.first), headers: admin_authorization_headers

    assert_response :success
    assert_select "h2", "Files"
  end
end
