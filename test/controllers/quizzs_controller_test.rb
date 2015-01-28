require 'test_helper'

class QuizzsControllerTest < ActionController::TestCase
  setup do
    @quizz = quizzs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quizzs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quizz" do
    assert_difference('Quizz.count') do
      post :create, quizz: { dateSuppression: @quizz.dateSuppression, description: @quizz.description, nom: @quizz.nom, ref: @quizz.ref }
    end

    assert_redirected_to quizz_path(assigns(:quizz))
  end

  test "should show quizz" do
    get :show, id: @quizz
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quizz
    assert_response :success
  end

  test "should update quizz" do
    patch :update, id: @quizz, quizz: { dateSuppression: @quizz.dateSuppression, description: @quizz.description, nom: @quizz.nom, ref: @quizz.ref }
    assert_redirected_to quizz_path(assigns(:quizz))
  end

  test "should destroy quizz" do
    assert_difference('Quizz.count', -1) do
      delete :destroy, id: @quizz
    end

    assert_redirected_to quizzs_path
  end
end
