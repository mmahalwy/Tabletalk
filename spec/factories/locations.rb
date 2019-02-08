# == Schema Information
#
# Table name: locations
#
#  id              :bigint(8)        not null, primary key
#  address         :string           default(""), not null
#  google_address  :json
#  name            :string           default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  city_id         :bigint(8)
#  google_place_id :string           default("")
#
# Indexes
#
#  index_locations_on_city_id  (city_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#

FactoryBot.define do
  factory :location do
    id { 1 }
    name { "MyString" }
    address { "MyString" }
    google_place_id { "MyString" }
    google_address { "" }
    created_at { "2019-01-27 18:02:31" }
    updated_at { "2019-01-27 18:02:31" }
  end
end
