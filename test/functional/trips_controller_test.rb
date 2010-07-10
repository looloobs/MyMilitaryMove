require 'test_helper'

class TripsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trip" do
    assert_difference('Trip.count') do
      post :create, :trip => { }
    end

    assert_redirected_to trip_path(assigns(:trip))
  end

  test "should show trip" do
    get :show, :id => trips(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => trips(:one).to_param
    assert_response :success
  end

  test "should update trip" do
    put :update, :id => trips(:one).to_param, :trip => { }
    assert_redirected_to trip_path(assigns(:trip))
  end

  test "should destroy trip" do
    assert_difference('Trip.count', -1) do
      delete :destroy, :id => trips(:one).to_param
    end

    assert_redirected_to trips_path
  end
end
