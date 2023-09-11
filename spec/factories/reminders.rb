FactoryBot.define do
  factory :reminder do
    title { Faker::Lorem.word }
    schedule { Faker::Date.between(from: '2023-10-01', to: '2030-12-31') }
    frequency_day { Faker::Number.between(from: 1, to: 1000) }
    frequency_week { Faker::Number.between(from: 1, to: 1000) }
    frequency_month { Faker::Number.between(from: 1, to: 1000) }
    frequency_year { Faker::Number.between(from: 1, to: 1000) }
    association :user
  end
end
