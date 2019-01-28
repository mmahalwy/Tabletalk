FactoryBot.define do
  factory :location do
    id { 1 }
    name { "MyString" }
    address { "MyString" }
    google_place_id { "MyString" }
    google_address { "" }
    created_at { "2019-01-27 18:02:31" }
    updated_at { "2019-01-27 18:02:31" }
  end
end
