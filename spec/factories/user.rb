FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email}
    password { Faker::Internet.password(min_length: 6) }
  end
end

FactoryBot.define do
  factory :user_wrong_name ,class: 'user' do
    name { Faker::Lorem.characters(number:31)}
    email { Faker::Internet.email}
    password { Faker::Internet.password(min_length: 6) }
  end
end

FactoryBot.define do
  factory :user_wrong_password ,class: 'user' do
    name { Faker::Name.name}
    email { Faker::Internet.email}
    password { Faker::Internet.password(min_length: 1) }
  end
end

FactoryBot.define do
  factory :user_wrong_introduction ,class: 'user' do
    name { Faker::Name.name }
    email { Faker::Internet.email}
    password { Faker::Internet.password(min_length: 6) }
    introduction { Faker::Lorem.characters(number:301)}
  end
end