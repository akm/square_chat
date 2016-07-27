require 'rails_helper'

RSpec.describe "rooms/index", type: :view do
  let(:organization){ FactoryGirl.create(:organization) }
  before(:each) do
    assign(:rooms, [
      FactoryGirl.create(:room, organization: organization, name: 'room1'),
      FactoryGirl.create(:room, organization: organization, name: 'room2'),
    ])
  end

  it "renders a list of rooms" do
    render
    assert_select "tr>td", :text => "room1", :count => 1
    assert_select "tr>td", :text => "room2", :count => 1
  end
end
