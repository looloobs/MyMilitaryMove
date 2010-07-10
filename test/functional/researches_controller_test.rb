require 'test_helper'

class ResearchesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:researches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create research" do
    assert_difference('Research.count') do
      post :create, :research => { }
    end

    assert_redirected_to research_path(assigns(:research))
  end

  test "should show research" do
    get :show, :id => researches(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => researches(:one).to_param
    assert_response :success
  end

  test "should update research" do
    put :update, :id => researches(:one).to_param, :research => { }
    assert_redirected_to research_path(assigns(:research))
  end

  test "should destroy research" do
    assert_difference('Research.count', -1) do
      delete :destroy, :id => researches(:one).to_param
    end

    assert_redirected_to researches_path
  end
end
