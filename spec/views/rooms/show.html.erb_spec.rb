require 'rails_helper'

RSpec.describe "rooms/show", type: :view do
  before(:each) do
    @room = assign(:room, FactoryGirl.create(:room))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
  end
end
