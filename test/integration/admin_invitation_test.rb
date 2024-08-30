# frozen_string_literal: true

require "test_helper"

class AdminInvitationTest < ActionDispatch::IntegrationTest
  setup do
    @admin = admins(:admin)
  end

  test "not able to invite other admins when logged out" do
    get new_admin_invitation_path

    assert_redirected_to new_admin_session_path
  end

  test "able to invite other admins when admin" do
    sign_in @admin

    get new_admin_invitation_path

    assert_response :success
  end

  # TODO: Add more tests here for the basic functionality:
  # test "create an admin invitation" do
  # end

  # test "accepting an admin invitation" do
  # end
end
