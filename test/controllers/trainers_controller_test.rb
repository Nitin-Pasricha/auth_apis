require "test_helper"

class TrainersControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_up" do
    get trainers_sign_up_url
    assert_response :success
  end

  test "should get sign_in" do
    get trainers_sign_in_url
    assert_response :success
  end

  test "should get edit_profile" do
    get trainers_edit_profile_url
    assert_response :success
  end
end
