class Weekly::SendMeetingRemindersJob < ApplicationJob
  queue_as :default

  def perform
    week = Week.last
    week.meetings.each(&:send_reminder_email)
  end
end
