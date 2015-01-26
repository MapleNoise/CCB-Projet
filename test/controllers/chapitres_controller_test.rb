require 'test_helper'

class ChapitresControllerTest < ActionController::TestCase
  setup do
    @chapitre = chapitres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chapitres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chapitre" do
    assert_difference('Chapitre.count') do
      post :create, chapitre: { dateSuppression: @chapitre.dateSuppression, description: @chapitre.description, nom: @chapitre.nom, ref: @chapitre.ref, texte: @chapitre.texte }
    end

    assert_redirected_to chapitre_path(assigns(:chapitre))
  end

  test "should show chapitre" do
    get :show, id: @chapitre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chapitre
    assert_response :success
  end

  test "should update chapitre" do
    patch :update, id: @chapitre, chapitre: { dateSuppression: @chapitre.dateSuppression, description: @chapitre.description, nom: @chapitre.nom, ref: @chapitre.ref, texte: @chapitre.texte }
    assert_redirected_to chapitre_path(assigns(:chapitre))
  end

  test "should destroy chapitre" do
    assert_difference('Chapitre.count', -1) do
      delete :destroy, id: @chapitre
    end

    assert_redirected_to chapitres_path
  end
end
