require 'rails_helper'

RSpec.describe "rooms/new", type: :view do
  let(:organization){ FactoryGirl.create(:organization) }
  before(:each) do
    assign(:organization, organization)
    assign(:room, FactoryGirl.build(:room, organization: organization))
  end

  it "renders new room form" do
    render

    assert_select "form[action=?][method=?]", organization_rooms_path(organization), "post" do

      assert_select "input#room_organization_id[name=?]", "room[organization_id]"

      assert_select "input#room_name[name=?]", "room[name]"
    end
  end
end
