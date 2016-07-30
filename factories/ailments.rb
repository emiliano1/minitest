FactoryGirl.define do
  factory :ailment do
    name { ['broken bones', 'eye trouble', 'heart disease'].sample + SecureRandom.random_number(100).to_s }

    specialties { build_list :specialty, 1 }
  end
end
