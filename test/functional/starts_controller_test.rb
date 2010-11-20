require 'test_helper'

class StartsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:starts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create start" do
    assert_difference('Start.count') do
      post :create, :start => { }
    end

    assert_redirected_to start_path(assigns(:start))
  end

  test "should show start" do
    get :show, :id => starts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => starts(:one).to_param
    assert_response :success
  end

  test "should update start" do
    put :update, :id => starts(:one).to_param, :start => { }
    assert_redirected_to start_path(assigns(:start))
  end

  test "should destroy start" do
    assert_difference('Start.count', -1) do
      delete :destroy, :id => starts(:one).to_param
    end

    assert_redirected_to starts_path
  end
end
