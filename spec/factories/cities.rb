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

FactoryBot.define do
  factory :city do
    id { 1 }
    name { "MyString" }
    state { "MyString" }
    country { "MyString" }
    enabled { false }
    created_at { "2019-01-27 18:02:30" }
    updated_at { "2019-01-27 18:02:30" }
  end
end
