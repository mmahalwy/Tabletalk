module Matcher
  class CityMatcher
    attr_reader :city, :week

    def initialize(city, week)
      @city = city
      @week = week
    end

    def confirmed_users
      @week.users.approved.where(city_id: @city.id)
    end

    def timeslots_by_availabilities
      Timeslot.all.reduce({}) do |all, timeslot|
        availabilities_for_week = timeslot.availabilities.where(user: confirmed_users)

        all.merge(timeslot.id => availabilities_for_week)
      end.sort_by do |_, avails|
        avails.count
      end.to_h
    end
  end
end
