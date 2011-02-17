require 'test_helper'

class InterviewsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interview" do
    assert_difference('Interview.count') do
      post :create, :interview => { }
    end

    assert_redirected_to interview_path(assigns(:interview))
  end

  test "should show interview" do
    get :show, :id => interviews(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => interviews(:one).to_param
    assert_response :success
  end

  test "should update interview" do
    put :update, :id => interviews(:one).to_param, :interview => { }
    assert_redirected_to interview_path(assigns(:interview))
  end

  test "should destroy interview" do
    assert_difference('Interview.count', -1) do
      delete :destroy, :id => interviews(:one).to_param
    end

    assert_redirected_to interviews_path
  end
end
