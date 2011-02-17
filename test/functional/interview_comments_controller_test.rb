require 'test_helper'

class InterviewCommentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interview_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interview_comment" do
    assert_difference('InterviewComment.count') do
      post :create, :interview_comment => { }
    end

    assert_redirected_to interview_comment_path(assigns(:interview_comment))
  end

  test "should show interview_comment" do
    get :show, :id => interview_comments(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => interview_comments(:one).to_param
    assert_response :success
  end

  test "should update interview_comment" do
    put :update, :id => interview_comments(:one).to_param, :interview_comment => { }
    assert_redirected_to interview_comment_path(assigns(:interview_comment))
  end

  test "should destroy interview_comment" do
    assert_difference('InterviewComment.count', -1) do
      delete :destroy, :id => interview_comments(:one).to_param
    end

    assert_redirected_to interview_comments_path
  end
end
