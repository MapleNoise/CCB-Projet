require 'test_helper'

class ExtensionFichiersControllerTest < ActionController::TestCase
  setup do
    @extension_fichier = extension_fichiers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:extension_fichiers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create extension_fichier" do
    assert_difference('ExtensionFichier.count') do
      post :create, extension_fichier: { extension: @extension_fichier.extension }
    end

    assert_redirected_to extension_fichier_path(assigns(:extension_fichier))
  end

  test "should show extension_fichier" do
    get :show, id: @extension_fichier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @extension_fichier
    assert_response :success
  end

  test "should update extension_fichier" do
    patch :update, id: @extension_fichier, extension_fichier: { extension: @extension_fichier.extension }
    assert_redirected_to extension_fichier_path(assigns(:extension_fichier))
  end

  test "should destroy extension_fichier" do
    assert_difference('ExtensionFichier.count', -1) do
      delete :destroy, id: @extension_fichier
    end

    assert_redirected_to extension_fichiers_path
  end
end
