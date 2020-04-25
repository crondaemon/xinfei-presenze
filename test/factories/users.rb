FactoryBot.define do
  factory :user do
    fullname { Faker::Name.name }
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 10) }
    password_confirmation { |u| u.password }
    active { true }
  end
end
