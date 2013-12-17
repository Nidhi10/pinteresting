require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  test "should get unvote" do
    get :unvote
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

end
