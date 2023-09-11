FactoryBot.define do
  factory :article do
    title { Faker::Lorem.word }
    association :user
  end
end
