require 'test_helper'

class SpousesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spouses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spouse" do
    assert_difference('Spouse.count') do
      post :create, :spouse => { }
    end

    assert_redirected_to spouse_path(assigns(:spouse))
  end

  test "should show spouse" do
    get :show, :id => spouses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => spouses(:one).to_param
    assert_response :success
  end

  test "should update spouse" do
    put :update, :id => spouses(:one).to_param, :spouse => { }
    assert_redirected_to spouse_path(assigns(:spouse))
  end

  test "should destroy spouse" do
    assert_difference('Spouse.count', -1) do
      delete :destroy, :id => spouses(:one).to_param
    end

    assert_redirected_to spouses_path
  end
end
