# frozen_string_literal: true

require "test_helper"

class CmsProtectedPagesTest < ActionDispatch::IntegrationTest
  setup do
    # create a nested protected CMS page under "secret" slug
    @secret_parent = Comfy::Cms::Page.create!(
      site: Comfy::Cms::Site.first,
      layout: Comfy::Cms::Layout.first,
      slug: "secret",
      label: "Secret Parent"
    )

    @page = Comfy::Cms::Page.create!(
      site: Comfy::Cms::Site.first,
      layout: Comfy::Cms::Layout.first,
      slug: "protected-page",
      label: "Protected Page",
      parent: @secret_parent
    )
  end

  test "visting protected page returns unauthorized" do
    get comfy_cms_render_page_path(cms_path: "secret/protected-page")

    assert_response :unauthorized
  end

  test "visting protected page with correct credentials returns success" do
    get comfy_cms_render_page_path(cms_path: "secret/protected-page"), headers: admin_authorization_headers

    assert_response :success
  end
end
