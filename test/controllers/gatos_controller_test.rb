require "test_helper"

class GatosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gato = gatos(:one)
  end

  test "should get index" do
    get gatos_url
    assert_response :success
  end

  test "should get new" do
    get new_gato_url
    assert_response :success
  end

  test "should create gato" do
    assert_difference("Gato.count") do
      post gatos_url, params: { gato: { breed: @gato.breed, description: @gato.description, image: @gato.image, name: @gato.name, user_id: @gato.user_id } }
    end

    assert_redirected_to gato_url(Gato.last)
  end

  test "should show gato" do
    get gato_url(@gato)
    assert_response :success
  end

  test "should get edit" do
    get edit_gato_url(@gato)
    assert_response :success
  end

  test "should update gato" do
    patch gato_url(@gato), params: { gato: { breed: @gato.breed, description: @gato.description, image: @gato.image, name: @gato.name, user_id: @gato.user_id } }
    assert_redirected_to gato_url(@gato)
  end

  test "should destroy gato" do
    assert_difference("Gato.count", -1) do
      delete gato_url(@gato)
    end

    assert_redirected_to gatos_url
  end
end
