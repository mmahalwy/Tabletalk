class ConfirmationsMailer < ApplicationMailer

  def confirm(user, week)
    @week = week
    @user = user

    mail to: user.email, subject: 'Meeting this week?'
  end
end
