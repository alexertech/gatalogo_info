require 'rails_helper'

RSpec.describe GatosController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:gato) { create(:gato, user: user) }
  let(:valid_attributes) { attributes_for(:gato) }
  let(:invalid_attributes) { { name: nil, breed: nil, description: nil } }

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns all gatos as @gatos" do
      gato # create gato by calling the let
      get :index
      expect(assigns(:gatos)).to eq([gato])
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      get :show, params: { id: gato.to_param }
      expect(response).to be_successful
    end

    it "assigns the requested gato as @gato" do
      get :show, params: { id: gato.to_param }
      expect(assigns(:gato)).to eq(gato)
    end
  end

  describe "GET #new" do
    context "when not logged in" do
      it "redirects to login page" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when logged in" do
      before { sign_in user }

      it "returns a successful response" do
        get :new
        expect(response).to be_successful
      end

      it "assigns a new gato as @gato" do
        get :new
        expect(assigns(:gato)).to be_a_new(Gato)
      end
    end
  end

  describe "GET #edit" do
    context "when not logged in" do
      it "redirects to login page" do
        get :edit, params: { id: gato.to_param }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when logged in as wrong user" do
      before { sign_in other_user }

      it "redirects to gatos path" do
        get :edit, params: { id: gato.to_param }
        expect(response).to redirect_to(gatos_path)
      end
    end

    context "when logged in as correct user" do
      before { sign_in user }

      it "returns a successful response" do
        get :edit, params: { id: gato.to_param }
        expect(response).to be_successful
      end

      it "assigns the requested gato as @gato" do
        get :edit, params: { id: gato.to_param }
        expect(assigns(:gato)).to eq(gato)
      end
    end
  end

  describe "POST #create" do
    context "when not logged in" do
      it "does not create a new gato" do
        expect {
          post :create, params: { gato: valid_attributes }
        }.not_to change(Gato, :count)
      end

      it "redirects to login page" do
        post :create, params: { gato: valid_attributes }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when logged in" do
      before { sign_in user }

      context "with valid params" do
        it "creates a new Gato" do
          expect {
            post :create, params: { gato: valid_attributes }
          }.to change(Gato, :count).by(1)
        end

        it "assigns a newly created gato as @gato" do
          post :create, params: { gato: valid_attributes }
          expect(assigns(:gato)).to be_a(Gato)
          expect(assigns(:gato)).to be_persisted
        end

        it "redirects to the created gato" do
          post :create, params: { gato: valid_attributes }
          expect(response).to redirect_to(Gato.last)
        end

        it "associates the gato with the current user" do
          post :create, params: { gato: valid_attributes }
          expect(Gato.last.user).to eq(user)
        end
      end

      context "with invalid params" do
        it "does not create a new Gato" do
          expect {
            post :create, params: { gato: invalid_attributes }
          }.not_to change(Gato, :count)
        end

        it "returns an unprocessable entity response" do
          post :create, params: { gato: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "PUT #update" do
    context "when not logged in" do
      it "does not update the gato" do
        put :update, params: { id: gato.to_param, gato: { name: "New Name" } }
        gato.reload
        expect(gato.name).not_to eq("New Name")
      end

      it "redirects to login page" do
        put :update, params: { id: gato.to_param, gato: { name: "New Name" } }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when logged in as correct user" do
      before { sign_in user }

      context "with valid params" do
        let(:new_attributes) { { name: "Updated Name", breed: "Bengal" } }

        it "updates the requested gato" do
          put :update, params: { id: gato.to_param, gato: new_attributes }
          gato.reload
          expect(gato.name).to eq("Updated Name")
          expect(gato.breed).to eq("Bengal")
        end

        it "redirects to the gato" do
          put :update, params: { id: gato.to_param, gato: new_attributes }
          expect(response).to redirect_to(gato)
        end
      end

      context "with invalid params" do
        it "returns an unprocessable entity response" do
          put :update, params: { id: gato.to_param, gato: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "DELETE #destroy" do
    context "when not logged in" do
      it "does not destroy the gato" do
        gato # create the gato
        expect {
          delete :destroy, params: { id: gato.to_param }
        }.not_to change(Gato, :count)
      end

      it "redirects to login page" do
        delete :destroy, params: { id: gato.to_param }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when logged in as correct user" do
      before { sign_in user }

      it "destroys the requested gato" do
        gato # create the gato
        expect {
          delete :destroy, params: { id: gato.to_param }
        }.to change(Gato, :count).by(-1)
      end

      it "redirects to the gatos list" do
        delete :destroy, params: { id: gato.to_param }
        expect(response).to redirect_to(gatos_url)
      end
    end
  end
end