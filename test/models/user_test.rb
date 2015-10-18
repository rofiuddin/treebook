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

  test "a user should have a profile name without spaces" do
    user = User.new
    user.profile_name = "My Profile With Spaces"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "a user can have a correctly formatted profile name" do
      user = User.new(first_name: 'Rofi', last_name: 'Uddin', email: 'somewhere@framgia.com') #treehouse bug, email has to be unique
      user.password = user.password_confirmation = 'asdfasdf'

      user.profile_name = 'rofi_1'
      assert user.valid?
    end

end
