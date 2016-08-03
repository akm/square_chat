require 'rails_helper'

RSpec.describe "rooms/edit", type: :view do
  let(:organization){ FactoryGirl.create(:organization) }
  before(:each) do
    assign(:organization, organization)
    @room = assign(:room, FactoryGirl.create(:room, organization: organization))
  end

  it "renders the edit room form" do
    render

    assert_select "form[action=?][method=?]", organization_room_path(organization, @room), "post" do

      assert_select "input#room_name[name=?]", "room[name]"
    end
  end
end
