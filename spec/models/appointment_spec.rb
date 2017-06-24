require 'rails_helper'

describe Appointment do
  subject { create :appointment }

  it { is_expected.to be_valid }

  describe 'associations' do
    it { should belong_to :patient }
    it { should belong_to :doctor }
    it { should belong_to :ailment }
  end

  describe '#recipient_emails' do
    it "returns patient's and doctor's emails" do
      specialty = create(:specialty)
      ailment = create(:ailment, specialties: [specialty])
      patient = create(:patient)
      doctor = create(:doctor, specialty: specialty)

      appointment = create(:appointment, patient: patient, doctor: doctor, ailment: ailment)

      expect(appointment.recipient_emails).to eq([patient.email, doctor.email])
    end
  end

  describe 'validations' do
    it "doesn't allow the appointment date to be less than 3 days from now" do
      appointment_for_yesterday = build(:appointment, appointment_on: Date.yesterday)
      appointment_for_today = build(:appointment, appointment_on: Date.today)
      appointment_for_tomorrow = build(:appointment, appointment_on: Date.tomorrow)
      appointment_for_2_days_from_now = build(:appointment, appointment_on: 2.days.from_now)

      expect(appointment_for_yesterday).to be_invalid
      expect(appointment_for_today).to be_invalid
      expect(appointment_for_tomorrow).to be_invalid
      expect(appointment_for_2_days_from_now).to be_invalid
    end

    it "doesn't allow a doctor that is not appropriate for the ailment" do
      specialty = create(:specialty, name: 'Orthopedist')
      non_appropriate_specialty = create(:specialty, name: 'Opthamologist')
      ailment = create(:ailment, specialties: [specialty])

      non_appropriate_doctor = create(:doctor, specialty: non_appropriate_specialty)
      no_specialty_doctor = create(:doctor, specialty: nil)

      non_appropriate_appointment = build(:appointment, ailment: ailment, doctor: non_appropriate_doctor)
      no_specialty_appointment = build(:appointment, ailment: ailment, doctor: no_specialty_doctor)

      expect(non_appropriate_appointment).to be_invalid
      expect(no_specialty_appointment).to be_invalid
    end
  end
end
