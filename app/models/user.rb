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
#  profile                :string           default(""), not null
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

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:linkedin]

  belongs_to :city
  has_many :availabilities
  has_many :timeslots, through: :availabilities
  has_many :confirmations
  has_many :user_meetings
  has_many :meetings, through: :user_meetings

  after_create :generate_email_token
  after_update :send_approved_email

  scope :approved, -> { where(approved: true) }
  scope :has_city, -> { where.not(city_id: nil) }

  enum role: { user: 0, admin: 1, community_manager: 2 }

  def send_approved_email
    UsersMailer.approved(self).deliver_later if saved_change_to_approved? && approved?
  end

  def met_before?(user2)
    return false unless meetings.exists?
    meetings.where(id: user2.meetings).exists?
  end

  def generate_email_token
    update(email_token: Devise.friendly_token)
  end

  def approve!
    update(approved: true)
  end

  def welcomed!
    update(welcomed: true)
  end

  def has_meeting_for_week?(week)
    meetings.exists?(week: week)
  end

  def self.send_confirmation_emails(week)
    approved.each do |user|
      user.generate_email_token
      ConfirmationsMailer.confirm(user, week).deliver_later
    end
  end

  def self.from_omniauth(auth) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize,Metrics/LineLength
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.image = auth.info.image
      user.title = auth.info.description
      user.profile = auth.info.urls.public_profile
      user.location = auth.info.location
      user.location_name = auth.info.location.name
      user.token = auth.credentials.token
      user.expires_at = auth.credentials.expires_at
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      data = session['devise.linkedin_data']

      if data.present? && session['devise.linkedin_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end
end
