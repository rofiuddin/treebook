require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "making sure user enter first_name" do
    user = User.new
    assert !user.save # user should not be saved in database
    assert !user.errors[:first_name].empty?
    # test "the truth" do
    #   assert true
    # end
  end
  test "making sure user enter last_name" do
    user = User.new
    assert !user.save # user should not be saved in database
    assert !user.errors[:last_name].empty?
    # test "the truth" do
    #   assert true
    # end
  end
  test "making sure user enter profile_name" do
    user = User.new
    assert !user.save # user should not be saved in database
    assert !user.errors[:profile_name].empty?
    # test "the truth" do
    #   assert true
    # end
  end
  test "making sure a user have unique profile_name" do
    user = User.new
    user.profile_name = users(:rofi).profile_name


    assert !user.save

    assert !user.errors[:profile_name].empty?
  end

  test "a user should have profile_name without spaces" do
    user = User.new
    user.profile_name = "My Profile with spaces"
    assert !user.save
    #puts user.errors.inspect
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted")
  end

end
