require 'rails_helper'

RSpec.describe "availabilities/show", type: :view do
  before(:each) do
    @availability = assign(:availability, Availability.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
