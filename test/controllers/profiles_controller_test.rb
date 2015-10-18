require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show of requested profile name" do
    get :show, id: users(:rofi).profile_name #id (key) is automatically generated, id maps to user object
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 if profile not found" do
  get :show, id: "doesnt exist"
  assert_response :not_found
  end

  test "that variables are assigned on successful profile viewing" do
    get :show, id: users(:rofi).profile_name
    #assigns contains instance variables from controllers in controller test, will makes sure instance variables and controllers are properly set
    assert assigns(:user)
    #want to make sure there is one or more status when viewing profile
    assert_not_empty assigns(:statuses)
  end

  test "only show the correct user's statuses" do
    get :show, id: users(:rofi).profile_name
    assigns(:statuses).each do |status|
    assert_equal users(:rofi), status.user
    end
  end

end
