# FactoryBot.define do
#   factory :book do
#     sequence(:title) { |n| "title#{n}"}
#     sequence(:body) { |n| "body#{n}"}
#   end
# end

FactoryBot.define do
  factory :user do
    name { Faker::Name.name(number: 5) }
    email { Faker::Internet.email(number: 20) }
    password { Faker::Lorem.characters(number: 10) }
  end
end
