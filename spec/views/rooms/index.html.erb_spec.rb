require 'rails_helper'

RSpec.describe "rooms/index", type: :view do
  before(:each) do
    assign(:rooms, [
      FactoryGirl.create(:room),
      FactoryGirl.create(:room),
    ])
  end

  it "renders a list of rooms" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
