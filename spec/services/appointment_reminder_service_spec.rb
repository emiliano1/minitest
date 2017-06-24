require 'rails_helper'

describe AppointmentReminderService do
  describe 'initialize' do
    it 'sets appointment variable' do
      appointment = build(:appointment)

      expect(AppointmentReminderService.new(appointment).appointment).to eq(appointment)
    end
  end

  describe 'perform' do
    it 'sends email to patient and doctor for new appointments' do
      appointment = create(:appointment)
      message_delivery = instance_double(ActionMailer::MessageDelivery)

      expect(AppointmentMailer).to receive(:appointment_scheduled_email).with(appointment).and_return(message_delivery)
      allow(message_delivery).to receive(:deliver_later)

      AppointmentReminderService.new(appointment).perform
    end
  end
end
