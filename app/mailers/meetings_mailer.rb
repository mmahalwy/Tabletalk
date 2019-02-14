class MeetingsMailer < ApplicationMailer
  def matched(meeting)
    @meeting = meeting
    emails = meeting.users.pluck(:email)

    Rails.logger.error "[MeetingsMailer] #{meeting.id} does not have emails" if emails.empty?

    # TODO: Should be branded
    # TODO: Should have locations
    mail to: emails, subject: "This week's meeting"
  end

  def reminder(meeting)
    @meeting = meeting
    emails = meeting.users.pluck(:email)

    Rails.logger.error "[MeetingsMailer] #{meeting.id} does not have emails" if emails.empty?

    # TODO: Should be branded
    # TODO: Should have locations
    mail to: emails,
         subject: 'Friendly reminder about your upcoming meeting'
  end

  def cancel(meeting, user)
    @meeting = meeting
    @user = user
    emails = meeting.users.pluck(:email)

    Rails.logger.error "[MeetingsMailer] #{meeting.id} does not have emails" if emails.empty?

    mail to: emails,
         subject: 'Someone needs to cancel this meeting'
  end
end
