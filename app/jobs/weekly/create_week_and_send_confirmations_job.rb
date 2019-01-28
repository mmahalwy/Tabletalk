class Weekly::CreateWeekAndSendConfirmationsJob < ApplicationJob
  queue_as :default

  def perform
    Week.create_week_and_send_confirmations
  end
end
