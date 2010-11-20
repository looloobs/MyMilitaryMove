require 'test_helper'

class NeighborhoodNotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:neighborhood_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create neighborhood_note" do
    assert_difference('NeighborhoodNote.count') do
      post :create, :neighborhood_note => { }
    end

    assert_redirected_to neighborhood_note_path(assigns(:neighborhood_note))
  end

  test "should show neighborhood_note" do
    get :show, :id => neighborhood_notes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => neighborhood_notes(:one).to_param
    assert_response :success
  end

  test "should update neighborhood_note" do
    put :update, :id => neighborhood_notes(:one).to_param, :neighborhood_note => { }
    assert_redirected_to neighborhood_note_path(assigns(:neighborhood_note))
  end

  test "should destroy neighborhood_note" do
    assert_difference('NeighborhoodNote.count', -1) do
      delete :destroy, :id => neighborhood_notes(:one).to_param
    end

    assert_redirected_to neighborhood_notes_path
  end
end
