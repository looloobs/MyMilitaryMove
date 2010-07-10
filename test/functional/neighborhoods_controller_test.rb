require 'test_helper'

class NeighborhoodsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:neighborhoods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create neighborhood" do
    assert_difference('Neighborhood.count') do
      post :create, :neighborhood => { }
    end

    assert_redirected_to neighborhood_path(assigns(:neighborhood))
  end

  test "should show neighborhood" do
    get :show, :id => neighborhoods(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => neighborhoods(:one).to_param
    assert_response :success
  end

  test "should update neighborhood" do
    put :update, :id => neighborhoods(:one).to_param, :neighborhood => { }
    assert_redirected_to neighborhood_path(assigns(:neighborhood))
  end

  test "should destroy neighborhood" do
    assert_difference('Neighborhood.count', -1) do
      delete :destroy, :id => neighborhoods(:one).to_param
    end

    assert_redirected_to neighborhoods_path
  end
end
