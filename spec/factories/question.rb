FactoryBot.define do
  factory :question do
    post_id {Faker::IDNumber.valid}
    correct_choice { Faker::Lorem.characters }
    first_wrong_choice { Faker::Lorem.characters}
    second_wrong_choice { Faker::Lorem.characters }
    direction { Faker::Lorem.characters}
    question { Faker::Lorem.characters}
    association :post ,factory: :post
  end
end
