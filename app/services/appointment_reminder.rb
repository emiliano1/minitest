class AppointmentReminder
  attr_reader :appointment
  
  def initialize(appointment)
    @appointment = appointment
  end
  
  def send_reminder_email
    # @remainging_days = (appointment.appointment_on - Date.today).to_i
    
    AppointmentMailer.appointment_scheduled_email(@appointment).deliver_now
  end
  
end
