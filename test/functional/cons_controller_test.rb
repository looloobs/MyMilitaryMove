require 'test_helper'

class ConsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create con" do
    assert_difference('Con.count') do
      post :create, :con => { }
    end

    assert_redirected_to con_path(assigns(:con))
  end

  test "should show con" do
    get :show, :id => cons(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cons(:one).to_param
    assert_response :success
  end

  test "should update con" do
    put :update, :id => cons(:one).to_param, :con => { }
    assert_redirected_to con_path(assigns(:con))
  end

  test "should destroy con" do
    assert_difference('Con.count', -1) do
      delete :destroy, :id => cons(:one).to_param
    end

    assert_redirected_to cons_path
  end
end
