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

class Timeslot < ApplicationRecord
  has_many :availabilities
  has_many :users, through: :availabilities

  default_scope { where(enabled: true) }

  def text
    "#{day_of_week} #{time_of_day}"
  end

  def day_of_week_symbol
    day_of_week.downcase.to_sym
  end
end
