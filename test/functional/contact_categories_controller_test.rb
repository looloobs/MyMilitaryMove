require 'test_helper'

class ContactCategoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_category" do
    assert_difference('ContactCategory.count') do
      post :create, :contact_category => { }
    end

    assert_redirected_to contact_category_path(assigns(:contact_category))
  end

  test "should show contact_category" do
    get :show, :id => contact_categories(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => contact_categories(:one).to_param
    assert_response :success
  end

  test "should update contact_category" do
    put :update, :id => contact_categories(:one).to_param, :contact_category => { }
    assert_redirected_to contact_category_path(assigns(:contact_category))
  end

  test "should destroy contact_category" do
    assert_difference('ContactCategory.count', -1) do
      delete :destroy, :id => contact_categories(:one).to_param
    end

    assert_redirected_to contact_categories_path
  end
end
