require "test_helper"

class GatosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @gato = gatos(:one)
    @user = users(:one)
    @other_user = users(:two)
  end

  test "should get index" do
    get gatos_url
    assert_response :success
  end

  test "should show gato" do
    get gato_url(@gato)
    assert_response :success
  end

  test "should redirect new when not logged in" do
    get new_gato_url
    assert_redirected_to new_user_session_path
  end

  test "should get new when logged in" do
    sign_in @user
    get new_gato_url
    assert_response :success
  end

  test "should redirect create when not logged in" do
    assert_no_difference("Gato.count") do
      post gatos_url, params: { gato: { breed: "Siamese", description: "A beautiful cat", name: "Fluffy" } }
    end
    assert_redirected_to new_user_session_path
  end

  test "should create gato when logged in" do
    sign_in @user
    assert_difference("Gato.count") do
      post gatos_url, params: { gato: { breed: "Siamese", description: "A beautiful cat", name: "Fluffy" } }
    end
    assert_redirected_to gato_url(Gato.last)
    assert_equal @user.id, Gato.last.user_id
  end

  test "should redirect edit when not logged in" do
    get edit_gato_url(@gato)
    assert_redirected_to new_user_session_path
  end

  test "should redirect edit when logged in as wrong user" do
    sign_in @other_user
    get edit_gato_url(@gato)
    assert_redirected_to gatos_path
  end

  test "should get edit when logged in as correct user" do
    sign_in @user
    get edit_gato_url(@gato)
    assert_response :success
  end

  test "should redirect update when not logged in" do
    patch gato_url(@gato), params: { gato: { breed: "Bengal", name: "Tiger" } }
    assert_redirected_to new_user_session_path
  end

  test "should update gato when logged in as correct user" do
    sign_in @user
    patch gato_url(@gato), params: { gato: { breed: "Bengal", name: "Tiger", description: "Updated description" } }
    assert_redirected_to gato_url(@gato)
    @gato.reload
    assert_equal "Bengal", @gato.breed
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference("Gato.count") do
      delete gato_url(@gato)
    end
    assert_redirected_to new_user_session_path
  end

  test "should destroy gato when logged in as correct user" do
    sign_in @user
    assert_difference("Gato.count", -1) do
      delete gato_url(@gato)
    end
    assert_redirected_to gatos_url
  end
end
