# == Schema Information
#
# Table name: weeks
#
#  id         :bigint(8)        not null, primary key
#  date_from  :date
#  date_to    :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_weeks_on_date_from  (date_from)
#  index_weeks_on_date_to    (date_to)
#

class Week < ApplicationRecord
  has_many :confirmations
  has_many :users, through: :confirmations
  has_many :meetings
  has_many :user_meetings, through: :meetings

  validates :date_to, uniqueness: true, presence: true
  validates :date_from, uniqueness: true, presence: true
  validate :dates_are_sunday
  validate :week_difference_between_dates

  def self.create_from_today(today = Date.today)
    beginning_of_week = today.beginning_of_week - 1.days # Sunday
    Week.create(
      date_from: beginning_of_week,
      date_to: beginning_of_week + 1.week
    )
  end

  def self.find_by_day(day)
    where('date_from <= ? AND date_to > ?', day, day).first
  end

  def self.create_week_and_send_confirmations
    week = create_from_today

    User.send_confirmation_emails(week)
  rescue
    Rails.logger.error 'Trying to create an already existed week'
  end

  def dates_are_sunday
    errors.add(:date_from, 'Must be a Sunday') if date_from.wday != 0
    errors.add(:date_to, 'Must be a Sunday') if date_to.wday != 0
  end

  def week_difference_between_dates
    return if date_to - 1.week == date_from
    errors.add(:date_from, 'Must be a week difference')
    errors.add(:date_to, 'Must be a week difference')
  end

  def users_without_meetings
    users.where.not(id: user_meetings.pluck(:user_id))
  end

  def confirmations_without_meetings
    confirmations.where.not(user_id: user_meetings.pluck(:user_id))
  end
end
