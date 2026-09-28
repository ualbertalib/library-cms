# frozen_string_literal: true

require "test_helper"

class CmsTest < ActionDispatch::IntegrationTest
  test "homepage" do
    get comfy_cms_render_page_path(cms_path: "")

    assert_response :success
    assert_select "h2", "Search the Library"
  end

  test "archives" do
    get comfy_cms_render_page_path(cms_path: "archives")

    assert_response :success
    assert_select "h2", "University of Alberta Archives"
  end

  test "Peel" do
    get comfy_cms_render_page_path(cms_path: "peel")

    assert_response :success
    assert_select "h1", "Peel's Prairie Provinces"
    assert_select "h2", "Peel's Prairie Provinces"
  end

  test "comfy admin CSS loads" do
    get "/assets/comfy/admin/cms/application.css"

    assert_response :success
    assert_includes response.body, "comfy"
  end

  test "layout CSS english-main loads" do
    get "/cms-css/1/english-main.css"

    assert_response :success
  end
end
