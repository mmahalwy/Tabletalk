require 'rails_helper'

RSpec.describe Matcher::TimeslotMatcher do
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

  let(:friday_8am) { create(:timeslot, day_of_week: 'Friday', time_of_day: '8 am', enabled: true) }
  let(:friday_9am) { create(:timeslot, day_of_week: 'Friday', time_of_day: '9 am', enabled: true) }
  let(:friday_2pm) { create(:timeslot, day_of_week: 'Friday', time_of_day: '2 pm', enabled: true) }

  describe "when all match" do
    subject { described_class.new(week, friday_8am.availabilities) }

    let!(:availabity1) { create(:availability, user: user1, timeslot: friday_8am) }
    let!(:availabity2) { create(:availability, user: user2, timeslot: friday_8am) }
    let!(:availabity3) { create(:availability, user: user3, timeslot: friday_8am) }
    let!(:availabity4) { create(:availability, user: user4, timeslot: friday_8am) }

    describe "#perform" do
      it "returns meetings" do
        subject.perform

        expect(Meeting.count).to eql(2)
      end
    end
  end

  describe "when some match" do
    subject { described_class.new(week, friday_9am.availabilities) }

    let!(:availabity1) { create(:availability, user: user1, timeslot: friday_9am) }
    let!(:availabity2) { create(:availability, user: user2, timeslot: friday_9am) }
    let!(:availabity3) { create(:availability, user: user3, timeslot: friday_9am) }

    describe "#perform" do
      it "returns meetings" do
        subject.perform

        expect(Meeting.count).to eql(1)
      end
    end
  end

  describe "a user has multiple availabilities" do
    subject { described_class.new(week, friday_9am.availabilities) }

    let!(:availabity1) { create(:availability, user: user1, timeslot: friday_8am) }
    let!(:availabity2) { create(:availability, user: user2, timeslot: friday_9am) }
    let!(:availabity3) { create(:availability, user: user3, timeslot: friday_9am) }
    let!(:availabity4) { create(:availability, user: user4, timeslot: friday_9am) }
    let!(:availabity5) { create(:availability, user: user1, timeslot: friday_9am) }

    describe "#perform" do
      it "returns meetings" do
        subject.perform

        expect(Meeting.count).to eql(2)
      end
    end
  end

  describe "when none match" do
    subject { described_class.new(week, friday_9am.availabilities) }

    let!(:availabity1) { create(:availability, user: user1, timeslot: friday_9am) }

    describe "#perform" do
      it "returns meetings" do
        subject.perform

        expect(Meeting.count).to eql(0)
      end
    end
  end
end
