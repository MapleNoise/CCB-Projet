require 'test_helper'

class TypeProduitsControllerTest < ActionController::TestCase
  setup do
    @type_produit = type_produits(:testunit)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_produits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_produit" do
    assert_difference('TypeProduit.count') do
      post :create, type_produit: { nom: @type_produit.nom.to_s + "test
        " }
    end

    assert_redirected_to type_produit_path(assigns(:type_produit))
  end

  test "should show type_produit" do
    get :show, id: @type_produit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_produit
    assert_response :success
  end

  test "should update type_produit" do
    patch :update, id: @type_produit, type_produit: { nom: @type_produit.nom }
    assert_redirected_to type_produit_path(assigns(:type_produit))
  end

  # test "should destroy type_produit" do
  #   assert_difference('TypeProduit.count', -1) do
  #     delete :destroy, id: @type_produit
  #   end
  #
  #   assert_redirected_to type_produits_path
  # end
end
