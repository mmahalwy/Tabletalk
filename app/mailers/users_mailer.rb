class UsersMailer < ApplicationMailer
  def approved(user)
    @user = user

    mail to: user.email
  end
end
