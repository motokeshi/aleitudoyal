FactoryBot.define do
  factory :record do
    implementation_record { Faker::Date.between(from: '2023-10-01', to: '2030-12-31') }
    association :reminder
  end
end
