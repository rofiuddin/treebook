require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test "that a status requires a content" do
    status = Status.new
    assert !status.save
    assert !status.errors[:content].empty?
  end

  test "that a status content should have 2 letters at least" do
    status = Status.new
    status.content = "H"
    assert !status.save
    assert !status.errors[:content].empty?
  end

  test "that a status has user id" do
    status = Status.new
    status.content = "Hello"
    assert !status.save
    assert !status.errors[:user_id].empty?
  end
  # test "the truth" do
  #   assert true
  # end
end
