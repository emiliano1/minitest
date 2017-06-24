class AppointmentReminderService
  attr_reader :appointment
  
  def initialize(appointment)
    @appointment = appointment
  end
  
  def perform
    AppointmentMailer.appointment_scheduled_email(@appointment).deliver_later
  end
end
