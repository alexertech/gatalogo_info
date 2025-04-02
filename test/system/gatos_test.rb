require "application_system_test_case"

class GatosTest < ApplicationSystemTestCase
  setup do
    @gato = gatos(:one)
  end

  test "visiting the index" do
    visit gatos_url
    assert_selector "h1", text: "Gatos"
  end

  test "should create gato" do
    visit gatos_url
    click_on "New gato"

    fill_in "Breed", with: @gato.breed
    fill_in "Description", with: @gato.description
    fill_in "Image", with: @gato.image
    fill_in "Name", with: @gato.name
    fill_in "User", with: @gato.user_id
    click_on "Create Gato"

    assert_text "Gato was successfully created"
    click_on "Back"
  end

  test "should update Gato" do
    visit gato_url(@gato)
    click_on "Edit this gato", match: :first

    fill_in "Breed", with: @gato.breed
    fill_in "Description", with: @gato.description
    fill_in "Image", with: @gato.image
    fill_in "Name", with: @gato.name
    fill_in "User", with: @gato.user_id
    click_on "Update Gato"

    assert_text "Gato was successfully updated"
    click_on "Back"
  end

  test "should destroy Gato" do
    visit gato_url(@gato)
    click_on "Destroy this gato", match: :first

    assert_text "Gato was successfully destroyed"
  end
end
