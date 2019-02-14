require 'rails_helper'

RSpec.describe "confirmations/index", type: :view do
  before(:each) do
    assign(:confirmations, [
      Confirmation.create!(),
      Confirmation.create!()
    ])
  end

  it "renders a list of confirmations" do
    render
  end
end
