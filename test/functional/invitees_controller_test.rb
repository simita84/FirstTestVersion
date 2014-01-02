require 'test_helper'

class InviteesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get eventInfo" do
    get :eventInfo
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get sendEventInvite" do
    get :sendEventInvite
    assert_response :success
  end

  test "should get memberResponseHandler" do
    get :memberResponseHandler
    assert_response :success
  end

end
