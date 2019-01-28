FactoryBot.define do
  factory :city do
    id { 1 }
    name { "MyString" }
    state { "MyString" }
    country { "MyString" }
    enabled { false }
    created_at { "2019-01-27 18:02:30" }
    updated_at { "2019-01-27 18:02:30" }
  end
end
