# == Schema Information
#
# Table name: user_descriptions
#
#  id         :bigint(8)        not null, primary key
#  content    :string
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#
# Indexes
#
#  index_user_descriptions_on_type     (type)
#  index_user_descriptions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe UserDescription, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
