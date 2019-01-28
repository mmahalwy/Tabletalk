# == Schema Information
#
# Table name: confirmations
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#  week_id    :bigint(8)
#
# Indexes
#
#  index_confirmations_on_user_id  (user_id)
#  index_confirmations_on_week_id  (week_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (week_id => weeks.id)
#

class Confirmation < ApplicationRecord
  belongs_to :week
  belongs_to :user

  scope :current, -> { order(:week_id).last }
end
