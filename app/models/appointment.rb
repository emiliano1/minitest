class Appointment < ActiveRecord::Base
  MINIMUM_DAYS = 3

  belongs_to :patient
  belongs_to :doctor
  belongs_to :ailment

  delegate :name, to: :patient, prefix: true, allow_nil: true
  delegate :name, :address, to: :doctor, prefix: true, allow_nil: true
  delegate :name, to: :ailment, prefix: true, allow_nil: true

  validates :patient, presence: true
  validates :doctor, presence: true
  validates :ailment, presence: true
  validates :appointment_on, presence: true

  validate :doctor_is_appropriate
  validate :appointment_on_is_valid

  # helper method to get recipient emails
  def recipient_emails
    [patient.try(:email), doctor.try(:email)].compact
  end

  private

  # checks if Doctor's Specialty is appropriate for the Ailment
  def doctor_is_appropriate
    return if ailment.nil? || doctor.nil?

    unless doctor.is_appropriate_for?(ailment)
      errors[:doctor] << "is not appropriate for this ailment"
    end
  end

  # check if date is at least 3 days from today
  def appointment_on_is_valid
    return if appointment_on.nil? || !appointment_on_changed?

    unless (appointment_on.to_date - Date.today) >= MINIMUM_DAYS
      errors[:appointment_on] << "should be at least #{MINIMUM_DAYS} days from today"
    end
  end
end
