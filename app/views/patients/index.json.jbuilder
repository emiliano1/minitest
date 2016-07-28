json.array!(@patients) do |patient|
  json.extract! patient, :id, :email, :first_name, :last_name, :street, :city, :state, :zip
  json.url patient_url(patient, format: :json)
end
