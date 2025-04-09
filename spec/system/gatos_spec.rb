require 'rails_helper'

RSpec.describe "Gatos", type: :system do
  let(:user) { create(:user) }
  let!(:gato) { create(:gato, user: user) }

  before do
    driven_by(:selenium_chrome_headless)
  end

  describe "index page" do
    it "shows the list of gatos" do
      visit gatos_path
      expect(page).to have_content("Gatos")
      expect(page).to have_content(gato.name)
    end
  end

  describe "show page" do
    it "displays the gato details" do
      visit gato_path(gato)
      expect(page).to have_content(gato.name)
      expect(page).to have_content(gato.breed)
      expect(page).to have_content(gato.description)
    end
  end

  describe "creating a gato" do
    context "when logged in" do
      before do
        sign_in user
        visit new_gato_path
      end

      it "allows creating a gato with valid attributes" do
        fill_in "Name", with: "Fluffy"
        fill_in "Breed", with: "Persian"
        fill_in "Description", with: "A beautiful cat with long fur."
        click_button "Create Gato"

        expect(page).to have_content("Cat was successfully created")
        expect(page).to have_content("Fluffy")
        expect(page).to have_content("Persian")
        expect(page).to have_content("A beautiful cat with long fur.")
      end

      it "shows validation errors with invalid attributes" do
        fill_in "Name", with: ""
        fill_in "Breed", with: ""
        fill_in "Description", with: ""
        click_button "Create Gato"

        expect(page).to have_content("errors prohibited this cat from being saved")
        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Breed can't be blank")
        expect(page).to have_content("Description can't be blank")
      end
    end

    context "when not logged in" do
      it "redirects to login page" do
        visit new_gato_path
        expect(page).to have_current_path(new_user_session_path)
      end
    end
  end

  describe "editing a gato" do
    context "when logged in as the owner" do
      before do
        sign_in user
        visit edit_gato_path(gato)
      end

      it "allows updating a gato with valid attributes" do
        fill_in "Name", with: "Updated Name"
        fill_in "Breed", with: "Siamese"
        click_button "Update Gato"

        expect(page).to have_content("Cat was successfully updated")
        expect(page).to have_content("Updated Name")
        expect(page).to have_content("Siamese")
      end
    end

    context "when not logged in" do
      it "redirects to login page" do
        visit edit_gato_path(gato)
        expect(page).to have_current_path(new_user_session_path)
      end
    end
  end

  describe "deleting a gato" do
    context "when logged in as the owner" do
      before do
        sign_in user
        visit gato_path(gato)
      end

      it "allows deleting a gato" do
        accept_confirm do
          click_link "Delete"
        end

        expect(page).to have_content("Cat was successfully destroyed")
        expect(page).not_to have_content(gato.name)
      end
    end
  end
end