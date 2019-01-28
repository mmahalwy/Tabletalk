class MeetingsMailer < ApplicationMailer
  def matched(meeting)
    @meeting = meeting
    emails = meeting.users.pluck(:email)

    Rails.logger.error "#{meeting.id} does not have emails" if emails.empty?

    # TODO: Should be branded
    # TODO: Should have locations
    mail to: emails, subject: "This week's meeting"
  end

  def reminder(meeting)
    @meeting = meeting
    emails = meeting.users.pluck(:email)

    Rails.logger.error "#{meeting.id} does not have emails" if emails.empty?

    # TODO: Should be branded
    # TODO: Should have locations
    mail to: emails,
         subject: 'Friendly reminder about your upcoming meeting'
  end
end
