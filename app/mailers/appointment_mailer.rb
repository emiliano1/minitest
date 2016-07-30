class AppointmentMailer < ApplicationMailer
  def appointment_scheduled_email(appointment)
    @appointment = appointment

    mail(to: @appointment.recipient_emails, subject: "Appointment Scheduled")
  end
end
