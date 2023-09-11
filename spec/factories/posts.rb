FactoryBot.define do
  factory :post do
    text { Faker::Lorem.sentence }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/testimg.jpg'), filename: 'test_img.jpg')
    end
    association :user
    association :article
  end
end
