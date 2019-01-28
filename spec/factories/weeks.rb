FactoryBot.define do
  factory :week do
    id { 1 }
    date_from { Date.today }
    date_to { Date.today + 1.week }
    created_at { "2019-01-27 18:02:34" }
    updated_at { "2019-01-27 18:02:34" }
  end
end
