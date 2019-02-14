require 'rails_helper'

RSpec.describe "confirmations/show", type: :view do
  before(:each) do
    @confirmation = assign(:confirmation, Confirmation.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
