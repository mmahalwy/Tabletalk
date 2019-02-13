class Weekly::CreateMeetingsJob < ApplicationJob
  queue_as :default

  def perform
    matcher = Matcher::Base.new
    matcher.perform
  end
end
