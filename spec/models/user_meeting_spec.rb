# == Schema Information
#
# Table name: user_meetings
#
#  id         :bigint(8)        not null, primary key
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  meeting_id :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_user_meetings_on_meeting_id  (meeting_id)
#  index_user_meetings_on_rating      (rating)
#  index_user_meetings_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (meeting_id => meetings.id)
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe UserMeeting, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
