require "rails_helper"

RSpec.describe Matcher::CityMatcher do
  subject { described_class.new(city, week) }

  let(:city) { create(:city) }
  let(:week) { create(:week) }
  let(:user1) { create(:user, city: city) }
  let(:user2) { create(:user, city: city) }
  let(:user3) { create(:user, city: city) }
  let(:user4) { create(:user, city: city) }

  let!(:confirmation1) { create(:confirmation, user: user1, week: week) }
  let!(:confirmation2) { create(:confirmation, user: user2, week: week) }
  let!(:confirmation3) { create(:confirmation, user: user3, week: week) }
  let!(:confirmation4) { create(:confirmation, user: user4, week: week) }

  let(:friday_8am) { create(:timeslot, day_of_week: "Friday", time_of_day: "8 am", enabled: true) }
  let(:friday_9am) { create(:timeslot, day_of_week: "Friday", time_of_day: "9 am", enabled: true) }
  let(:friday_2pm) { create(:timeslot, day_of_week: "Friday", time_of_day: "2 pm", enabled: true) }

  let!(:availabity1) { create(:availability, user: user1, timeslot: friday_9am) }
  let!(:availabity2) { create(:availability, user: user2, timeslot: friday_9am) }
  let!(:availabity3) { create(:availability, user: user3, timeslot: friday_2pm) }
  let!(:availabity4) { create(:availability, user: user4, timeslot: friday_9am) }
  let!(:availabity5) { create(:availability, user: user1, timeslot: friday_8am) }

  describe "#confirmed_users" do
    it "returns confirmed users for the week" do
      expect(subject.confirmed_users.size).to eql(Confirmation.count)
    end
  end

  describe "#timeslots_by_availabilities" do
    it "returns availabilities by timeslot" do
      expect(
        subject.timeslots_by_availabilities.keys
      ).to match_array([
        friday_9am.id,
        friday_8am.id,
        friday_2pm.id,
      ])
      expect(
        subject.timeslots_by_availabilities[friday_9am.id]
      ).to match_array([
        availabity1,
        availabity2,
        availabity4,
      ])
      expect(
        subject.timeslots_by_availabilities[friday_8am.id]
      ).to match_array([
        availabity5,
      ])
      expect(
        subject.timeslots_by_availabilities[friday_2pm.id]
      ).to match_array([
        availabity3,
      ])
    end
  end
end
