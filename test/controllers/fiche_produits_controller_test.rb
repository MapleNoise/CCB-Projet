require 'test_helper'

class FicheProduitsControllerTest < ActionController::TestCase
  setup do
    @fiche_produit = fiche_produits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fiche_produits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fiche_produit" do
    assert_difference('FicheProduit.count') do
      post :create, fiche_produit: { dateCreation: @fiche_produit.dateCreation, dateModification: @fiche_produit.dateModification, datePublication: @fiche_produit.datePublication, dateSuppression: @fiche_produit.dateSuppression, description: @fiche_produit.description, descriptionCourte: @fiche_produit.descriptionCourte, ref: @fiche_produit.ref, titre: @fiche_produit.titre }
    end

    assert_redirected_to fiche_produit_path(assigns(:fiche_produit))
  end

  test "should show fiche_produit" do
    get :show, id: @fiche_produit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fiche_produit
    assert_response :success
  end

  test "should update fiche_produit" do
    patch :update, id: @fiche_produit, fiche_produit: { dateCreation: @fiche_produit.dateCreation, dateModification: @fiche_produit.dateModification, datePublication: @fiche_produit.datePublication, dateSuppression: @fiche_produit.dateSuppression, description: @fiche_produit.description, descriptionCourte: @fiche_produit.descriptionCourte, ref: @fiche_produit.ref, titre: @fiche_produit.titre }
    assert_redirected_to fiche_produit_path(assigns(:fiche_produit))
  end

  test "should destroy fiche_produit" do
    assert_difference('FicheProduit.count', -1) do
      delete :destroy, id: @fiche_produit
    end

    assert_redirected_to fiche_produits_path
  end
end
