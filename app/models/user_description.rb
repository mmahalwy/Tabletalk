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

class UserDescription < ApplicationRecord
  belongs_to :user

  self.inheritance_column = nil
  ABOUT_YOURSELF = 'about_yourself'.freeze
  LOOKING_TO_MEET = 'looking_to_meet'.freeze
  INTERESTED_IN = 'interested_in'.freeze

  TYPES = {
    ABOUT_YOURSELF => 1,
    LOOKING_TO_MEET => 2,
    INTERESTED_IN => 3,
  }.freeze

  TYPES_INPUTS = {
    ABOUT_YOURSELF => {
      placeholder: 'I am a self-taught engineer, etc',
      label: 'Little about yourself',
    },
    LOOKING_TO_MEET => {
      placeholder: 'Meeting founders, investing, hiring, etc',
      label: 'What do you hope to get from the community?',
    },
    INTERESTED_IN => {
      placeholder: 'Bitcoin, Fintech, healthcare, etc',
      label: 'What are you interested in?',
    },
  }.freeze

  enum type: TYPES

  scope :enabled, -> { where(type: TYPES_INPUTS.keys) }

  validates_uniqueness_of :type, scope: :user_id
end