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

FactoryBot.define do
  factory :week do
    id { 1 }
    date_from { Date.today.next_occurring(:sunday) }
    date_to { (Date.today + 1.week).next_occurring(:sunday) }
    created_at { "2019-01-27 18:02:34" }
    updated_at { "2019-01-27 18:02:34" }
  end
end
