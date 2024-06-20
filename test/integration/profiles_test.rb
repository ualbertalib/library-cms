# frozen_string_literal: true

require "test_helper"

class ProfilesTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get profiles_url

    assert_response :success
  end

  test "should get show" do
    get profile_url(profiles(:one))

    assert_response :success
  end

  test "should get new" do
    get new_profile_url, headers: admin_authorization_headers

    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(profiles(:one)), headers: admin_authorization_headers

    assert_response :success
  end

  test "should create profile" do
    assert_difference("Profile.count") do
      post profiles_url,
        params: {profile: {first_name: "John", last_name: "Doe", email: "email@ualberta.ca"}},
        headers: admin_authorization_headers
    end

    assert_redirected_to profile_url(Profile.last)
  end

  test "should update profile" do
    patch profile_url(@profile),
      params: {profile: {first_name: "John"}},
      headers: admin_authorization_headers

    @profile.reload

    assert_redirected_to profile_url(@profile)
    assert_equal "John", @profile.first_name
  end

  test "should destroy profile" do
    assert_difference("Profile.count", -1) do
      delete profile_url(@profile), headers: admin_authorization_headers
    end

    assert_redirected_to profiles_url
  end
end
