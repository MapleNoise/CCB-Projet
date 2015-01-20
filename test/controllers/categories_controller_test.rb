#encoding: UTF-8
require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:testunit)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should not create category (uniqueness)" do
    assert_not( Categorie.create({ nom: @category.nom }).save )
  end

  test "should create category" do
    assert_difference('Categorie.count') do
      post :create, categorie: { nom: "#{@category.nom}unit", mere: @category.mere }
    end
    assert_redirected_to category_path(assigns(:categorie))
  end

  test "should show category" do
    get :show, id: @category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category
    assert_response :success
  end

  test "should update category" do
    patch :update, id: @category, categorie: { dateSuppression: @category.dateSuppression, mere: @category.mere, nom: @category.nom }
    assert_redirected_to category_path(assigns(:categorie))
  end
  
  test "doit mettre à jour le champs dateSuppression" do
    @category.delete!
    @category.save
    assert ( @category[:dateSuppression] != nil)
  end

  # test "should destroy category" do
  #   assert_difference('Categorie.count', -1) do
  #     delete :destroy, id: @category
  #   end
  #
  #   assert_redirected_to categories_path
  # end
end
