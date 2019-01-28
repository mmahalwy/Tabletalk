require 'rails_helper'

RSpec.describe "availabilities/new", type: :view do
  before(:each) do
    assign(:availability, Availability.new())
  end

  it "renders new availability form" do
    render

    assert_select "form[action=?][method=?]", availabilities_path, "post" do
    end
  end
end
