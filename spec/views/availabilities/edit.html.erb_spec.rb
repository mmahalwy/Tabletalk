require 'rails_helper'

RSpec.describe "availabilities/edit", type: :view do
  before(:each) do
    @availability = assign(:availability, Availability.create!())
  end

  it "renders the edit availability form" do
    render

    assert_select "form[action=?][method=?]", availability_path(@availability), "post" do
    end
  end
end
