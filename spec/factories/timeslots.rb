# == Schema Information
#
# Table name: timeslots
#
#  id          :bigint(8)        not null, primary key
#  day_of_week :string
#  enabled     :boolean          default(FALSE), not null
#  time_of_day :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_timeslots_on_day_of_week  (day_of_week)
#  index_timeslots_on_enabled      (enabled)
#  index_timeslots_on_time_of_day  (time_of_day)
#

FactoryBot.define do
  factory :timeslot do
    day_of_week { "MyString" }
    time_of_day { "MyString" }
    enabled { false }
  end
end
