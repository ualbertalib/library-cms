# frozen_string_literal: true

require_relative "../../test_helper"

class Admin::AdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = admins(:admin)
    sign_in @admin
  end

  def test_get_index
    get admin_admins_path

    assert_response :success
  end

  def test_get_show
    get admin_admin_path(@admin)

    assert_response :success
  end

  def test_get_show_failure
    get admin_admin_path("invalid")

    assert_response :redirect
    assert_redirected_to action: :index
    assert_equal "Admin not found", flash[:danger]
  end

  def test_get_new
    get new_admin_admin_path

    assert_response :success
    assert_select "form[action='/admin/admins']"
  end

  def test_get_edit
    get edit_admin_admin_path(@admin)

    assert_response :success
    assert_select "form[action='/admin/admins/#{@admin.id}']"
  end

  def test_creation
    assert_difference "Admin.count" do
      post admin_admins_path, params: {admin: {
        email: "new_admin@example.com",
        password: "password"
      }}
      admin = Admin.last

      assert_response :redirect
      assert_redirected_to action: :show, id: admin
      assert_equal "Admin created successfully", flash[:success]
    end
  end

  def test_creation_failure
    assert_no_difference "Admin.count" do
      post admin_admins_path, params: {admin: {}}

      assert_response :success
      assert_equal "Admin creation failed", flash[:danger]
    end
  end

  def test_update
    put admin_admin_path(@admin), params: {admin: {
      email: "new_email@example.com"
    }}

    assert_response :redirect
    assert_redirected_to action: :show, id: @admin
    assert_equal "Admin updated successfully", flash[:success]
    @admin.reload

    assert_equal "new_email@example.com", @admin.email
  end

  def test_update_failure
    put admin_admin_path(@admin), params: {admin: {
      email: ""
    }}

    assert_response :success
    assert_equal "Admin update failed", flash[:danger]
    @admin.reload

    assert_not_equal "", @admin.email
  end

  def test_destroy
    assert_difference "Admin.count", -1 do
      delete admin_admin_path(@admin)

      assert_response :redirect
      assert_redirected_to action: :index
      assert_equal "Admin deleted successfully", flash[:success]
    end
  end
end
