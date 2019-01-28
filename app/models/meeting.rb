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

class Meeting < ApplicationRecord
  MAX_USERS = 2

  belongs_to :week
  belongs_to :timeslot
  has_many :user_meetings, dependent: :destroy
  has_many :users, through: :user_meetings

  validates :week_id, presence: true
  validates :timeslot_id, presence: true

  after_create :send_matched_email

  def full?
    user_meetings.count == MAX_USERS
  end

  def send_matched_email
    MeetingsMailer.matched(self).deliver_later
  end

  def send_reminder_email
    MeetingsMailer.reminder(self).deliver_later
  end
end
