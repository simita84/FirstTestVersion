require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get listProducts" do
    get :listProducts
    assert_response :success
  end

  test "should get listReviews" do
    get :listReviews
    assert_response :success
  end

end
