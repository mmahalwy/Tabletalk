require 'rails_helper'

RSpec.describe "confirmations/edit", type: :view do
  before(:each) do
    @confirmation = assign(:confirmation, Confirmation.create!())
  end

  it "renders the edit confirmation form" do
    render

    assert_select "form[action=?][method=?]", confirmation_path(@confirmation), "post" do
    end
  end
end
