require 'test_helper'

class PalabraBolsasControllerTest < ActionController::TestCase
  setup do
    @palabra_bolsa = palabra_bolsas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:palabra_bolsas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create palabra_bolsa" do
    assert_difference('PalabraBolsa.count') do
      post :create, palabra_bolsa: { id_palabrab: @palabra_bolsa.id_palabrab, nombre_palabra: @palabra_bolsa.nombre_palabra, puntaje: @palabra_bolsa.puntaje }
    end

    assert_redirected_to palabra_bolsa_path(assigns(:palabra_bolsa))
  end

  test "should show palabra_bolsa" do
    get :show, id: @palabra_bolsa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @palabra_bolsa
    assert_response :success
  end

  test "should update palabra_bolsa" do
    patch :update, id: @palabra_bolsa, palabra_bolsa: { id_palabrab: @palabra_bolsa.id_palabrab, nombre_palabra: @palabra_bolsa.nombre_palabra, puntaje: @palabra_bolsa.puntaje }
    assert_redirected_to palabra_bolsa_path(assigns(:palabra_bolsa))
  end

  test "should destroy palabra_bolsa" do
    assert_difference('PalabraBolsa.count', -1) do
      delete :destroy, id: @palabra_bolsa
    end

    assert_redirected_to palabra_bolsas_path
  end
end
