FactoryGirl.define do
  factory :specialty do
    name { ['Orthopedist',  'Opthamologist', 'Cardiologist'].sample + SecureRandom.random_number(100).to_s }
  end
end
