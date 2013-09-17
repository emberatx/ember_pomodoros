require 'test_helper'

class PomodorosControllerTest < ActionController::TestCase
  setup do
    @pomodoro = pomodoros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pomodoros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pomodoro" do
    assert_difference('Pomodoro.count') do
      post :create, pomodoro: { completed_at: @pomodoro.completed_at, started_at: @pomodoro.started_at, status: @pomodoro.status, task_id: @pomodoro.task_id }
    end

    assert_redirected_to pomodoro_path(assigns(:pomodoro))
  end

  test "should show pomodoro" do
    get :show, id: @pomodoro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pomodoro
    assert_response :success
  end

  test "should update pomodoro" do
    patch :update, id: @pomodoro, pomodoro: { completed_at: @pomodoro.completed_at, started_at: @pomodoro.started_at, status: @pomodoro.status, task_id: @pomodoro.task_id }
    assert_redirected_to pomodoro_path(assigns(:pomodoro))
  end

  test "should destroy pomodoro" do
    assert_difference('Pomodoro.count', -1) do
      delete :destroy, id: @pomodoro
    end

    assert_redirected_to pomodoros_path
  end
end
