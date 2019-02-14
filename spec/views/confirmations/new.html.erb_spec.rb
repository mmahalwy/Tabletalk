require 'rails_helper'

RSpec.describe "confirmations/new", type: :view do
  before(:each) do
    assign(:confirmation, Confirmation.new())
  end

  it "renders new confirmation form" do
    render

    assert_select "form[action=?][method=?]", confirmations_path, "post" do
    end
  end
end
