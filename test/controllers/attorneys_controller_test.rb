require 'test_helper'

class AttorneysControllerTest < ActionController::TestCase
  setup do
    @attorney = attorneys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attorneys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attorney" do
    assert_difference('Attorney.count') do
      post :create, attorney: { bar_number: @attorney.bar_number, fax_number: @attorney.fax_number, office_address: @attorney.office_address }
    end

    assert_redirected_to attorney_path(assigns(:attorney))
  end

  test "should show attorney" do
    get :show, id: @attorney
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attorney
    assert_response :success
  end

  test "should update attorney" do
    patch :update, id: @attorney, attorney: { bar_number: @attorney.bar_number, fax_number: @attorney.fax_number, office_address: @attorney.office_address }
    assert_redirected_to attorney_path(assigns(:attorney))
  end

  test "should destroy attorney" do
    assert_difference('Attorney.count', -1) do
      delete :destroy, id: @attorney
    end

    assert_redirected_to attorneys_path
  end
end
