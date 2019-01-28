module Matcher
  class TimeslotMatcher
    attr_reader :availabilities, :week, :max_users

    def initialize(week, availabilities, max_users = Meeting::MAX_USERS)
      @week = week
      @availabilities = availabilities.to_a
      @max_users = max_users
    end

    def perform
      # Until the array is empty or has one element, therefore, cannot
      # create a match
      until @availabilities.size <= 1
        avail1 = @availabilities.first

        matched_avails = match_availabilities(avail1)

        # We default the avail1 as the first to matched_avails
        # thus, we check if it's the only one there
        if matched_avails.size == 1
          # could not find a match for you, sorry!
          @availabilities.delete(avail1)
          next
        end

        create_meeting(matched_avails)
      end
    end

    private

    def match_availabilities(avail1)
      matched = [avail1]

      return matched if has_meeting_for_week?(avail1)

      availabilities.each do |avail2|
        break if matched.size == @max_users

        # same avail
        next if avail1.id == avail2.id
        next if has_meeting_for_week?(avail2)
        next if met_before?(avail1, avail2)

        matched.push(avail2)
      end

      matched
    end

    def has_meeting_for_week?(avail)
      avail.user.has_meeting_for_week?(@week)
    end

    def met_before?(avail1, avail2)
      avail1.user.met_before?(avail2.user)
    end

    def create_meeting(availabilities)
      meeting = Meeting.create!(
        timeslot: availabilities.first.timeslot,
        week: @week
      )

      availabilities.each do |availability|
        meeting.users << availability.user
        @availabilities.delete(availability)
      end

      meeting

    rescue => e
      Rails.logger.error "Matcher::TimeslotMatcher error=#{error.inspect}"
    end
  end
end
