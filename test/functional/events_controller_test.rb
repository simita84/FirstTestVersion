require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get listEvents" do
    get :listEvents
    assert_response :success
  end

  test "should get showEvents" do
    get :showEvents
    assert_response :success
  end

  test "should get createEvents" do
    get :createEvents
    assert_response :success
  end

  test "should get editEvents" do
    get :editEvents
    assert_response :success
  end

  test "should get deleteEvents" do
    get :deleteEvents
    assert_response :success
  end

end
