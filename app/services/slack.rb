module Slack
  include HTTParty

  base_uri 'https://hooks.slack.com'

  def self.new_user(user)
    body = {
      text: ":raised_hands:  New user signed up! #{user.profile_url}",
      channel: '#alerts-tabletalk',
    }

    Rails.logger.debug '[Slack] #new_user'
    call(body)
  end

  def self.format_body(body)
    body.to_json
  end

  def self.call(body)
    post(Rails.application.credentials.slack_webhook, { body: format_body(body) })
  end
end
