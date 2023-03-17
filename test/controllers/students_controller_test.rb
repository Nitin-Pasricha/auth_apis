require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_up" do
    get students_sign_up_url
    assert_response :success
  end

  test "should get sign_in" do
    get students_sign_in_url
    assert_response :success
  end
end
