require 'test_helper'

class KonkursControllerTest < ActionController::TestCase
  setup do
    @konkur = konkurs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:konkurs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create konkur" do
    assert_difference('Konkur.count') do
      post :create, konkur: { ime: @konkur.ime, iznos: @konkur.iznos, otvaranje: @konkur.otvaranje, rok: @konkur.rok }
    end

    assert_redirected_to konkur_path(assigns(:konkur))
  end

  test "should show konkur" do
    get :show, id: @konkur
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @konkur
    assert_response :success
  end

  test "should update konkur" do
    patch :update, id: @konkur, konkur: { ime: @konkur.ime, iznos: @konkur.iznos, otvaranje: @konkur.otvaranje, rok: @konkur.rok }
    assert_redirected_to konkur_path(assigns(:konkur))
  end

  test "should destroy konkur" do
    assert_difference('Konkur.count', -1) do
      delete :destroy, id: @konkur
    end

    assert_redirected_to konkurs_path
  end
end
