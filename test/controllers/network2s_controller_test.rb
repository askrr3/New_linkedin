require 'test_helper'

class Network2sControllerTest < ActionController::TestCase
  setup do
    @network2 = network2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:network2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create network2" do
    assert_difference('Network2.count') do
      post :create, network2: { networkee_id: @network2.networkee_id, user_id: @network2.user_id }
    end

    assert_redirected_to network2_path(assigns(:network2))
  end

  test "should show network2" do
    get :show, id: @network2
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @network2
    assert_response :success
  end

  test "should update network2" do
    patch :update, id: @network2, network2: { networkee_id: @network2.networkee_id, user_id: @network2.user_id }
    assert_redirected_to network2_path(assigns(:network2))
  end

  test "should destroy network2" do
    assert_difference('Network2.count', -1) do
      delete :destroy, id: @network2
    end

    assert_redirected_to network2s_path
  end
end
