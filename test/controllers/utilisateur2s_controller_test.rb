require 'test_helper'

class Utilisateur2sControllerTest < ActionController::TestCase
  setup do
    @utilisateur2 = utilisateur2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:utilisateur2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create utilisateur2" do
    assert_difference('Utilisateur2.count') do
      post :create, utilisateur2: { email: @utilisateur2.email, name: @utilisateur2.name, password_digest: @utilisateur2.password_digest }
    end

    assert_redirected_to utilisateur2_path(assigns(:utilisateur2))
  end

  test "should show utilisateur2" do
    get :show, id: @utilisateur2
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @utilisateur2
    assert_response :success
  end

  test "should update utilisateur2" do
    patch :update, id: @utilisateur2, utilisateur2: { email: @utilisateur2.email, name: @utilisateur2.name, password_digest: @utilisateur2.password_digest }
    assert_redirected_to utilisateur2_path(assigns(:utilisateur2))
  end

  test "should destroy utilisateur2" do
    assert_difference('Utilisateur2.count', -1) do
      delete :destroy, id: @utilisateur2
    end

    assert_redirected_to utilisateur2s_path
  end
end
