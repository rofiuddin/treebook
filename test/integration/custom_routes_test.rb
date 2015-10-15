require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest

  test "that /sign_in opens the sign in page" do
    get "/sign_in"
    assert_response :success
  end
  test "that /sign_out opens the sign out page" do
    get "/sign_out"
    assert_response :redirect
    assert_redirected_to '/'
  end
  test "that /sign_up opens the sign up page" do
    get "/sign_up"
    assert_response :success
  end
  # test "the truth" do
  #   assert true
  # end
end
