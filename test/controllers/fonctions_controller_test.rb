require 'test_helper'

class FonctionsControllerTest < ActionController::TestCase
  setup do
    @fonction = fonctions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fonctions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fonction" do
    assert_difference('Fonction.count') do
      post :create, fonction: { nom: @fonction.nom }
    end

    assert_redirected_to fonction_path(assigns(:fonction))
  end

  test "should show fonction" do
    get :show, id: @fonction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fonction
    assert_response :success
  end

  test "should update fonction" do
    patch :update, id: @fonction, fonction: { nom: @fonction.nom }
    assert_redirected_to fonction_path(assigns(:fonction))
  end

  test "should destroy fonction" do
    assert_difference('Fonction.count', -1) do
      delete :destroy, id: @fonction
    end

    assert_redirected_to fonctions_path
  end
end
