require 'rails_helper'

describe DoctorsController do

  let(:valid_attributes) { attributes_for :doctor }

  let(:invalid_attributes) { attributes_for :doctor, email: 'invalid_email' }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all doctors as @doctors" do
      doctor = Doctor.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:doctors)).to eq([doctor])
    end
  end

  describe "GET #show" do
    it "assigns the requested doctor as @doctor" do
      doctor = Doctor.create! valid_attributes
      get :show, {:id => doctor.to_param}, valid_session
      expect(assigns(:doctor)).to eq(doctor)
    end
  end

  describe "GET #new" do
    it "assigns a new doctor as @doctor" do
      get :new, {}, valid_session
      expect(assigns(:doctor)).to be_a_new(Doctor)
    end
  end

  describe "GET #edit" do
    it "assigns the requested doctor as @doctor" do
      doctor = Doctor.create! valid_attributes
      get :edit, {:id => doctor.to_param}, valid_session
      expect(assigns(:doctor)).to eq(doctor)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Doctor" do
        expect {
          post :create, {:doctor => valid_attributes}, valid_session
        }.to change(Doctor, :count).by(1)
      end

      it "assigns a newly created doctor as @doctor" do
        post :create, {:doctor => valid_attributes}, valid_session
        expect(assigns(:doctor)).to be_a(Doctor)
        expect(assigns(:doctor)).to be_persisted
      end

      it "redirects to the created doctor" do
        post :create, {:doctor => valid_attributes}, valid_session
        expect(response).to redirect_to(Doctor.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved doctor as @doctor" do
        post :create, {:doctor => invalid_attributes}, valid_session
        expect(assigns(:doctor)).to be_a_new(Doctor)
      end

      it "re-renders the 'new' template" do
        post :create, {:doctor => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { first_name: 'John', last_name: 'Doe' } }

      it "updates the requested doctor" do
        doctor = Doctor.create! valid_attributes
        put :update, {:id => doctor.to_param, :doctor => new_attributes}, valid_session
        doctor.reload
        expect(doctor.first_name).to eq 'John'
        expect(doctor.last_name).to eq 'Doe'
      end

      it "assigns the requested doctor as @doctor" do
        doctor = Doctor.create! valid_attributes
        put :update, {:id => doctor.to_param, :doctor => valid_attributes}, valid_session
        expect(assigns(:doctor)).to eq(doctor)
      end

      it "redirects to the doctor" do
        doctor = Doctor.create! valid_attributes
        put :update, {:id => doctor.to_param, :doctor => valid_attributes}, valid_session
        expect(response).to redirect_to(doctor)
      end
    end

    context "with invalid params" do
      it "assigns the doctor as @doctor" do
        doctor = Doctor.create! valid_attributes
        put :update, {:id => doctor.to_param, :doctor => invalid_attributes}, valid_session
        expect(assigns(:doctor)).to eq(doctor)
      end

      it "re-renders the 'edit' template" do
        doctor = Doctor.create! valid_attributes
        put :update, {:id => doctor.to_param, :doctor => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested doctor" do
      doctor = Doctor.create! valid_attributes
      expect {
        delete :destroy, {:id => doctor.to_param}, valid_session
      }.to change(Doctor, :count).by(-1)
    end

    it "redirects to the doctors list" do
      doctor = Doctor.create! valid_attributes
      delete :destroy, {:id => doctor.to_param}, valid_session
      expect(response).to redirect_to(doctors_url)
    end
  end

end
