# == Schema Information
#
# Table name: availabilities
#
#  id          :bigint(8)        not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  timeslot_id :bigint(8)
#  user_id     :bigint(8)
#
# Indexes
#
#  index_availabilities_on_timeslot_id  (timeslot_id)
#  index_availabilities_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (timeslot_id => timeslots.id)
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :availability do
  end
end
