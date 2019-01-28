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

class UserMeeting < ApplicationRecord
  belongs_to :user
  belongs_to :meeting

  validates :meeting_id, presence: true
  validates :user_id, presence: true
  validates :user_id, uniqueness: {
    scope: :meeting_id
  }

  # # Should not allow for meeting same user
  # validates :user1_id, uniqueness: {
  #   scope: :user2_id,
  #   message: 'User1 already had meeting with user2'
  # }
  # validates :user2_id, uniqueness: {
  #   scope: :user1_id,
  #   message: 'User2 already had meeting with user1'
  # }
  # # Should only have one meeting per week
  # validates :user1_id, uniqueness: {
  #   scope: :week_id,
  #   message: 'User already has meeting this week'
  # }
  # validates :user2_id, uniqueness: {
  #   scope: :week_id,
  #   message: 'User already has meeting this week'
  # }

  validate :max_count, if: :meeting_id?
  # Should not allow for same timeslot for same week
  validate :user_has_one_meeting_per_week, if: %i[ user_id? meeting_id?]

  delegate :timeslot, :timeslot_id, :week, :week_id, to: :meeting

  def max_count
    # Has to be `<` since record is not created yet!
    return if UserMeeting.where(meeting_id: meeting_id).count < Meeting::MAX_USERS
    errors.add(:user_id, 'Cannot add more users to this meeting!')
  end

  def user_has_one_meeting_per_week
    # TODO: this is different if multiple timeslots allowed.
    return if user.meetings.where(week_id: week_id).empty?
    errors.add(:user_id, 'User already has meeting this week')
  end
end
