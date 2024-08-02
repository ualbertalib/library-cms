# frozen_string_literal: true

require "test_helper"

class CmsTest < ActionDispatch::IntegrationTest
  test "homepage" do
    get comfy_cms_render_page_path(cms_path: "")

    assert_response :success
    assert_select "h2", "Search the Library"
  end
  test "ask us page" do
    get comfy_cms_render_page_path(cms_path: "ask-us")

    assert_response :success
    assert_select "h1", /Ask Us/
    assert_select "h2", "Chat with Us"
  end

  test "about page" do
    get comfy_cms_render_page_path(cms_path: "about")

    assert_response :success
    assert_select "h1", /About the Library/
    assert_select "h2", "A Message from our Chief Librarian"
  end
end
