module Matcher
  def initialize(today = Date.today, week = nil)
    @today = today
    @week = week || Week.find_by_day(today)
  end

  def perform
    City.enabled.all.each do |city|
      match_for_city(city)
    end
  end

  def match_for_city(city)
    city_matcher = Matcher::CityMatcher.new(city, @week)

    timeslots_by_availabilities = city_matcher.timeslots_by_availabilities

    timeslots_by_availabilities.each do |timeslot_id, availabilities|
      timeslot_matcher = Matcher::TimeslotMatcher.new(@week, availabilities)

      timeslot_matcher.perform
    end
  rescue => e
    Rails.logger.error "MatcherTrigger: error=#{e.inspect}"
  end
end
