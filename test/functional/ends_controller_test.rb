require 'test_helper'

class EndsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create end" do
    assert_difference('End.count') do
      post :create, :end => { }
    end

    assert_redirected_to end_path(assigns(:end))
  end

  test "should show end" do
    get :show, :id => ends(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ends(:one).to_param
    assert_response :success
  end

  test "should update end" do
    put :update, :id => ends(:one).to_param, :end => { }
    assert_redirected_to end_path(assigns(:end))
  end

  test "should destroy end" do
    assert_difference('End.count', -1) do
      delete :destroy, :id => ends(:one).to_param
    end

    assert_redirected_to ends_path
  end
end
