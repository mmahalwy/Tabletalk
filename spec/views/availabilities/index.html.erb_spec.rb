require 'rails_helper'

RSpec.describe "availabilities/index", type: :view do
  before(:each) do
    assign(:availabilities, [
      Availability.create!(),
      Availability.create!()
    ])
  end

  it "renders a list of availabilities" do
    render
  end
end
