FactoryBot.define do
  factory :post do
    content { Faker::Lorem.characters }
    genre {Faker::Number.between(from: 0, to: 2) }
    association :user, factory: :user
  end
end