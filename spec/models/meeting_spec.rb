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

require 'rails_helper'

RSpec.describe Meeting, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
