# == Schema Information
#
# Table name: cities
#
#  id         :bigint(8)        not null, primary key
#  country    :string           default(""), not null
#  enabled    :boolean          default(FALSE), not null
#  name       :string           default(""), not null
#  state      :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_cities_on_enabled  (enabled)
#  index_cities_on_name     (name)
#

class City < ApplicationRecord
  has_many :users

  scope :enabled, -> { where(enabled: true) }

  validates_uniqueness_of :name, scope: :state
end
