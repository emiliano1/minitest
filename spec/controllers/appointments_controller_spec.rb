require 'rails_helper'

describe AppointmentsController do
  let(:ailment) { create(:ailment) }
  let(:patient) { create(:patient) }
  let(:doctor) { create(:doctor, specialty: ailment.specialties.sample) }
  let(:valid_attributes) { attributes_for(:appointment, ailment_id: ailment.id, patient_id: patient.id, doctor_id: doctor.id) }
  let(:invalid_attributes) { attributes_for(:appointment, ailment_id: nil) }
  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Appointment" do
        expect {
          post :create, {:appointment => valid_attributes}, valid_session
        }.to change(Appointment, :count).by(1)
      end

      it "assigns a newly created appointment as @appointment" do
        post :create, {:appointment => valid_attributes}, valid_session
        expect(assigns(:appointment)).to be_a(Appointment)
        expect(assigns(:appointment)).to be_persisted
      end

      it "redirects to the created appointment" do
        post :create, {:appointment => valid_attributes}, valid_session
        expect(response).to redirect_to(Appointment.last)
      end

      it "calls AppointmentReminderService" do
        expect(AppointmentReminderService).to receive(:new).and_call_original

        post :create, {:appointment => valid_attributes}, valid_session
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved appointment as @appointment" do
        post :create, {:appointment => invalid_attributes}, valid_session
        expect(assigns(:appointment)).to be_a_new(Appointment)
      end

      it "re-renders the 'new' template" do
        post :create, {:appointment => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end

      it "doesn't call AppointmentReminderService" do
        expect(AppointmentReminderService).to_not receive(:new)

        post :create, {:appointment => invalid_attributes}, valid_session
      end
    end
  end
end
