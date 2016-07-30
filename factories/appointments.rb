FactoryGirl.define do
  factory :appointment do
    patient
    ailment

    appointment_on { Faker::Date.between(3.days.from_now, 10.days.from_now) }

    after :build do |appointment|
      appointment.doctor ||= create(:doctor, specialty: appointment.ailment.specialties.sample)
    end
  end
end
