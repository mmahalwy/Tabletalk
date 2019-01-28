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

class Location < ApplicationRecord
  belongs_to :city
end
