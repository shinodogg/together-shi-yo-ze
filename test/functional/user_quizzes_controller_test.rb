require 'test_helper'

class UserQuizzesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_quizzes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_quiz" do
    assert_difference('UserQuiz.count') do
      post :create, :user_quiz => { }
    end

    assert_redirected_to user_quiz_path(assigns(:user_quiz))
  end

  test "should show user_quiz" do
    get :show, :id => user_quizzes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => user_quizzes(:one).to_param
    assert_response :success
  end

  test "should update user_quiz" do
    put :update, :id => user_quizzes(:one).to_param, :user_quiz => { }
    assert_redirected_to user_quiz_path(assigns(:user_quiz))
  end

  test "should destroy user_quiz" do
    assert_difference('UserQuiz.count', -1) do
      delete :destroy, :id => user_quizzes(:one).to_param
    end

    assert_redirected_to user_quizzes_path
  end
end
