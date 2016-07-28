require 'rails_helper'

describe PatientsController do

  let(:valid_attributes) { attributes_for :patient }

  let(:invalid_attributes) { attributes_for :patient, email: 'invalid_email' }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all patients as @patients" do
      patient = Patient.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:patients)).to eq([patient])
    end
  end

  describe "GET #show" do
    it "assigns the requested patient as @patient" do
      patient = Patient.create! valid_attributes
      get :show, {:id => patient.to_param}, valid_session
      expect(assigns(:patient)).to eq(patient)
    end
  end

  describe "GET #new" do
    it "assigns a new patient as @patient" do
      get :new, {}, valid_session
      expect(assigns(:patient)).to be_a_new(Patient)
    end
  end

  describe "GET #edit" do
    it "assigns the requested patient as @patient" do
      patient = Patient.create! valid_attributes
      get :edit, {:id => patient.to_param}, valid_session
      expect(assigns(:patient)).to eq(patient)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Patient" do
        expect {
          post :create, {:patient => valid_attributes}, valid_session
        }.to change(Patient, :count).by(1)
      end

      it "assigns a newly created patient as @patient" do
        post :create, {:patient => valid_attributes}, valid_session
        expect(assigns(:patient)).to be_a(Patient)
        expect(assigns(:patient)).to be_persisted
      end

      it "redirects to the created patient" do
        post :create, {:patient => valid_attributes}, valid_session
        expect(response).to redirect_to(Patient.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved patient as @patient" do
        post :create, {:patient => invalid_attributes}, valid_session
        expect(assigns(:patient)).to be_a_new(Patient)
      end

      it "re-renders the 'new' template" do
        post :create, {:patient => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { first_name: 'John', last_name: 'Doe' } }

      it "updates the requested patient" do
        patient = Patient.create! valid_attributes
        put :update, {:id => patient.to_param, :patient => new_attributes}, valid_session
        patient.reload
        expect(patient.first_name).to eq 'John'
        expect(patient.last_name).to eq 'Doe'
      end

      it "assigns the requested patient as @patient" do
        patient = Patient.create! valid_attributes
        put :update, {:id => patient.to_param, :patient => valid_attributes}, valid_session
        expect(assigns(:patient)).to eq(patient)
      end

      it "redirects to the patient" do
        patient = Patient.create! valid_attributes
        put :update, {:id => patient.to_param, :patient => valid_attributes}, valid_session
        expect(response).to redirect_to(patient)
      end
    end

    context "with invalid params" do
      it "assigns the patient as @patient" do
        patient = Patient.create! valid_attributes
        put :update, {:id => patient.to_param, :patient => invalid_attributes}, valid_session
        expect(assigns(:patient)).to eq(patient)
      end

      it "re-renders the 'edit' template" do
        patient = Patient.create! valid_attributes
        put :update, {:id => patient.to_param, :patient => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested patient" do
      patient = Patient.create! valid_attributes
      expect {
        delete :destroy, {:id => patient.to_param}, valid_session
      }.to change(Patient, :count).by(-1)
    end

    it "redirects to the patients list" do
      patient = Patient.create! valid_attributes
      delete :destroy, {:id => patient.to_param}, valid_session
      expect(response).to redirect_to(patients_url)
    end
  end

end
