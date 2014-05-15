require 'test_helper'

class RaspisivacsControllerTest < ActionController::TestCase
  setup do
    @raspisivac = raspisivacs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:raspisivacs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create raspisivac" do
    assert_difference('Raspisivac.count') do
      post :create, raspisivac: { name: @raspisivac.name }
    end

    assert_redirected_to raspisivac_path(assigns(:raspisivac))
  end

  test "should show raspisivac" do
    get :show, id: @raspisivac
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @raspisivac
    assert_response :success
  end

  test "should update raspisivac" do
    patch :update, id: @raspisivac, raspisivac: { name: @raspisivac.name }
    assert_redirected_to raspisivac_path(assigns(:raspisivac))
  end

  test "should destroy raspisivac" do
    assert_difference('Raspisivac.count', -1) do
      delete :destroy, id: @raspisivac
    end

    assert_redirected_to raspisivacs_path
  end
end
