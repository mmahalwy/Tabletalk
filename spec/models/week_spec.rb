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

require 'rails_helper'

RSpec.describe Week, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
