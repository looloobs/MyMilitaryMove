require 'test_helper'

class ProsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pro" do
    assert_difference('Pro.count') do
      post :create, :pro => { }
    end

    assert_redirected_to pro_path(assigns(:pro))
  end

  test "should show pro" do
    get :show, :id => pros(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pros(:one).to_param
    assert_response :success
  end

  test "should update pro" do
    put :update, :id => pros(:one).to_param, :pro => { }
    assert_redirected_to pro_path(assigns(:pro))
  end

  test "should destroy pro" do
    assert_difference('Pro.count', -1) do
      delete :destroy, :id => pros(:one).to_param
    end

    assert_redirected_to pros_path
  end
end
