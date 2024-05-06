# frozen_string_literal: true

require "test_helper"

class CmsTest < ActionDispatch::IntegrationTest
  test "homepage" do
    get comfy_cms_render_page_path(cms_path: "")

    assert_response :success
    assert_select "h2", "Search the Library"
  end

  test "hours and locations page" do
    get comfy_cms_render_page_path(cms_path: 'hours-locations')

    assert_response :success
    assert_select "h1", /Hours & Locations/
  end

  test "about us page" do
    get comfy_cms_render_page_path(cms_path: 'about-us')

    assert_response :success
    assert_select "h1", /About Us/
    assert_select "h2", "A Message from our Chief Librarian"
  end
end
