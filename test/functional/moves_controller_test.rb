require 'test_helper'

class MovesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create move" do
    assert_difference('Move.count') do
      post :create, :move => { }
    end

    assert_redirected_to move_path(assigns(:move))
  end

  test "should show move" do
    get :show, :id => moves(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => moves(:one).to_param
    assert_response :success
  end

  test "should update move" do
    put :update, :id => moves(:one).to_param, :move => { }
    assert_redirected_to move_path(assigns(:move))
  end

  test "should destroy move" do
    assert_difference('Move.count', -1) do
      delete :destroy, :id => moves(:one).to_param
    end

    assert_redirected_to moves_path
  end
end
