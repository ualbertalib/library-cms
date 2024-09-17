# frozen_string_literal: true

require "test_helper"

class CmsAdminTest < ActionDispatch::IntegrationTest
  test "unauthorized access to admin gets redirected to sign in page" do
    get comfy_admin_cms_path

    assert_redirected_to new_admin_session_path
  end

  test "/admin redirects to first site's pages index" do
    sign_in admins(:admin)
    get comfy_admin_cms_path

    assert_response :redirect
    assert_redirected_to comfy_admin_cms_site_pages_path(site_id: Comfy::Cms::Site.first)
  end

  test "admin sites index" do
    sign_in admins(:admin)
    get comfy_admin_cms_sites_path

    assert_response :success
    assert_select "h2", "Sites"
  end

  test "admin site pages index" do
    sign_in admins(:admin)
    get comfy_admin_cms_site_pages_path(site_id: Comfy::Cms::Site.first)

    assert_response :success
    assert_select "h2", "Pages"
  end

  test "admin site layouts index" do
    sign_in admins(:admin)
    get comfy_admin_cms_site_layouts_path(site_id: Comfy::Cms::Site.first)

    assert_response :success
    assert_select "h2", "Layouts"
  end

  test "admin site snippets index" do
    sign_in admins(:admin)
    get comfy_admin_cms_site_snippets_path(site_id: Comfy::Cms::Site.first)

    assert_response :success
    assert_select "h2", "Snippets"
  end

  test "admin site files index" do
    sign_in admins(:admin)
    get comfy_admin_cms_site_files_path(site_id: Comfy::Cms::Site.first)

    assert_response :success
    assert_select "h2", "Files"
  end
end
