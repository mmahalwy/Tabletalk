# Preview all emails at http://localhost:3000/rails/mailers/confirmations
class ConfirmationsPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/confirmations/confirm
  def confirm
    ConfirmationsMailer.confirm
  end

end
