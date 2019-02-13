# Preview all emails at http://localhost:3000/rails/mailers/meetings
class MeetingsPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/meetings/matched
  def matched
    MeetingsMailer.matched(Meeting.first)
  end

  # Preview this email at http://localhost:3000/rails/mailers/meetings/reminder
  def reminder
    MeetingsMailer.reminder(Meeting.first)
  end

end
