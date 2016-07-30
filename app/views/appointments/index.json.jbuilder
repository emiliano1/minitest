json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :patient_name, :doctor_name, :ailment_name, :appointment_on
  json.url appointment_url(appointment, format: :json)
end
