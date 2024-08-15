# frozen_string_literal: true

require_relative "../../test_helper"

class Admin::AdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = admins(:default)
  end

  # Vanilla CMS has BasicAuth, so we need to send that with each request.
  # Change this to fit your app's authentication strategy.
  # Move this to test_helper.rb
  def r(verb, path, options = {})
    headers = options[:headers] || {}
    headers["HTTP_AUTHORIZATION"] =
      ActionController::HttpAuthentication::Basic.encode_credentials(
        ComfortableMexicanSofa::AccessControl::AdminAuthentication.username,
        ComfortableMexicanSofa::AccessControl::AdminAuthentication.password
      )
    options[:headers] = headers
    send(verb, path, options)
  end

  def test_get_index
    r :get, admin_admins_path

    assert_response :success
    assert assigns(:admins)
    assert_template :index
  end

  def test_get_show
    r :get, admin_admin_path(@admin)

    assert_response :success
    assert assigns(:admin)
    assert_template :show
  end

  def test_get_show_failure
    r :get, admin_admin_path("invalid")

    assert_response :redirect
    assert_redirected_to action: :index
    assert_equal "Admin not found", flash[:danger]
  end

  def test_get_new
    r :get, new_admin_admin_path

    assert_response :success
    assert assigns(:admin)
    assert_template :new
    assert_select "form[action='/admin/admins']"
  end

  def test_get_edit
    r :get, edit_admin_admin_path(@admin)

    assert_response :success
    assert assigns(:admin)
    assert_template :edit
    assert_select "form[action='/admin/admins/#{@admin.id}']"
  end

  def test_creation
    assert_difference "Admin.count" do
      r :post, admin_admins_path, params: {admin: {
        name: "test name"
      }}
      admin = Admin.last

      assert_response :redirect
      assert_redirected_to action: :show, id: admin
      assert_equal "Admin created", flash[:success]
    end
  end

  def test_creation_failure
    assert_no_difference "Admin.count" do
      r :post, admin_admins_path, params: {admin: {}}

      assert_response :success
      assert_template :new
      assert_equal "Failed to create Admin", flash[:danger]
    end
  end

  def test_update
    r :put, admin_admin_path(@admin), params: {admin: {
      name: "Updated"
    }}

    assert_response :redirect
    assert_redirected_to action: :show, id: @admin
    assert_equal "Admin updated", flash[:success]
    @admin.reload

    assert_equal "Updated", @admin.name
  end

  def test_update_failure
    r :put, admin_admin_path(@admin), params: {admin: {
      name: ""
    }}

    assert_response :success
    assert_template :edit
    assert_equal "Failed to update Admin", flash[:danger]
    @admin.reload

    assert_not_equal "", @admin.name
  end

  def test_destroy
    assert_difference "Admin.count", -1 do
      r :delete, admin_admin_path(@admin)

      assert_response :redirect
      assert_redirected_to action: :index
      assert_equal "Admin deleted", flash[:success]
    end
  end
end
