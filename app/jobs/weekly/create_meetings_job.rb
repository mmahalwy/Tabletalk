class Weekly::CreateMeetingsJob < ApplicationJob
  queue_as :default

  def perform
    matcher = Matcher.new
    matcher.perform
  end
end
