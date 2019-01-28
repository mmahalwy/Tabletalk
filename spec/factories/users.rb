FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Devise.friendly_token[0, 20] }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    description1 { Faker::Job.title }
    profile { Faker::Avatar.image }
    approved { true }
  end
end
