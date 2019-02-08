# == Schema Information
#
# Table name: meetings
#
#  id          :bigint(8)        not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  timeslot_id :bigint(8)
#  week_id     :bigint(8)
#
# Indexes
#
#  index_meetings_on_timeslot_id  (timeslot_id)
#  index_meetings_on_week_id      (week_id)
#
# Foreign Keys
#
#  fk_rails_...  (timeslot_id => timeslots.id)
#  fk_rails_...  (week_id => weeks.id)
#

FactoryBot.define do
  factory :meeting do
    id { 1 }
    created_at { "2019-01-27 18:02:32" }
    updated_at { "2019-01-27 18:02:32" }
  end
end
