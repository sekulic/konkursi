require 'test_helper'

class KonkursiControllerTest < ActionController::TestCase
  setup do
    @konkurs = konkursi(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:konkursi)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create konkurs" do
    assert_difference('Konkurs.count') do
      post :create, konkurs: { ime: @konkurs.ime, iznos: @konkurs.iznos, otvaranje: @konkurs.otvaranje, rok: @konkurs.rok }
    end

    assert_redirected_to konkurs_path(assigns(:konkurs))
  end

  test "should show konkurs" do
    get :show, id: @konkurs
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @konkurs
    assert_response :success
  end

  test "should update konkurs" do
    patch :update, id: @konkurs, konkurs: { ime: @konkurs.ime, iznos: @konkurs.iznos, otvaranje: @konkurs.otvaranje, rok: @konkurs.rok }
    assert_redirected_to konkurs_path(assigns(:konkurs))
  end

  test "should destroy konkurs" do
    assert_difference('Konkurs.count', -1) do
      delete :destroy, id: @konkurs
    end

    assert_redirected_to konkursi_path
  end
end
