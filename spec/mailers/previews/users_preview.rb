# Preview all emails at http://localhost:3000/rails/mailers/users
class UsersPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/users/approved
  def approved
    UsersMailer.approved
  end

end
