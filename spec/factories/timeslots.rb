FactoryBot.define do
  factory :timeslot do
    day_of_week { "MyString" }
    time_of_day { "MyString" }
    enabled { false }
  end
end
