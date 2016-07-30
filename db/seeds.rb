orthopedist = Specialty.find_or_create_by!(name: 'Orthopedist')
opthamologist = Specialty.find_or_create_by!(name: 'Opthamologist')
cardiologist = Specialty.find_or_create_by!(name: 'Cardiologist')

Ailment.find_or_create_by!(name: 'broken bones') do |ailment|
  ailment.specialties << orthopedist
end

Ailment.find_or_create_by!(name: 'eye trouble') do |ailment|
  ailment.specialties << opthamologist
end

Ailment.find_or_create_by!(name: 'heart disease') do |ailment|
  ailment.specialties << cardiologist
end

10.times do
  FactoryGirl.create :doctor, specialty: Specialty.order("RANDOM()").first
end

10.times do
  FactoryGirl.create :patient
end
