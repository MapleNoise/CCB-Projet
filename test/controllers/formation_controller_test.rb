require 'test_helper'

class FormationControllerTest < ActionController::TestCase
  test "should get ref:string" do
    get :ref:string
    assert_response :success
  end

  test "should get nom:string" do
    get :nom:string
    assert_response :success
  end

  test "should get descriptionCourte:string" do
    get :descriptionCourte:string
    assert_response :success
  end

  test "should get description:string" do
    get :description:string
    assert_response :success
  end

  test "should get estPublic:boolean" do
    get :estPublic:boolean
    assert_response :success
  end

  test "should get dateSuppression:datetime" do
    get :dateSuppression:datetime
    assert_response :success
  end

end
