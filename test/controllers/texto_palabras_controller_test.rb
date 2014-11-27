require 'test_helper'

class TextoPalabrasControllerTest < ActionController::TestCase
  setup do
    @texto_palabra = texto_palabras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:texto_palabras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create texto_palabra" do
    assert_difference('TextoPalabra.count') do
      post :create, texto_palabra: { id_palabrab: @texto_palabra.id_palabrab, id_texto: @texto_palabra.id_texto, id_tp: @texto_palabra.id_tp }
    end

    assert_redirected_to texto_palabra_path(assigns(:texto_palabra))
  end

  test "should show texto_palabra" do
    get :show, id: @texto_palabra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @texto_palabra
    assert_response :success
  end

  test "should update texto_palabra" do
    patch :update, id: @texto_palabra, texto_palabra: { id_palabrab: @texto_palabra.id_palabrab, id_texto: @texto_palabra.id_texto, id_tp: @texto_palabra.id_tp }
    assert_redirected_to texto_palabra_path(assigns(:texto_palabra))
  end

  test "should destroy texto_palabra" do
    assert_difference('TextoPalabra.count', -1) do
      delete :destroy, id: @texto_palabra
    end

    assert_redirected_to texto_palabras_path
  end
end
