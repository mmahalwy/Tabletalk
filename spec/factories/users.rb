# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  approved               :boolean          default(FALSE), not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  description1           :text             default(""), not null
#  description2           :text             default(""), not null
#  description3           :text             default(""), not null
#  email                  :string           default(""), not null
#  email_token            :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  expires_at             :integer
#  first_name             :string           default(""), not null
#  image                  :string           default(""), not null
#  last_name              :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  location               :json             not null
#  location_name          :string           default(""), not null
#  profile_url            :string           default(""), not null
#  provider               :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("user"), not null
#  sign_in_count          :integer          default(0), not null
#  title                  :string           default(""), not null
#  token                  :string
#  uid                    :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  city_id                :integer
#
# Indexes
#
#  index_users_on_city_id               (city_id)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_email_token           (email_token) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Devise.friendly_token[0, 20] }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    profile_url { Faker::Avatar.image }
    approved { true }
  end
end
