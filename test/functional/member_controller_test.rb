require 'test_helper'

class MemberControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get listProducts" do
    get :listProducts
    assert_response :success
  end

  test "should get listRecipes" do
    get :listRecipes
    assert_response :success
  end

  test "should get listReviews" do
    get :listReviews
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "should get events" do
    get :events
    assert_response :success
  end

  test "should get attempt_login" do
    get :attempt_login
    assert_response :success
  end

  test "should get listMembers" do
    get :listMembers
    assert_response :success
  end

end
