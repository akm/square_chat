require 'rails_helper'

RSpec.describe "organizations/index", type: :view do
  before(:each) do
    assign(:organizations, [
      FactoryGirl.create(:organization, name: 'org1'),
      FactoryGirl.create(:organization, name: 'org2'),
    ])
  end

  it "renders a list of organizations" do
    render
    assert_select "tr>td", :text => "org1", :count => 1
    assert_select "tr>td", :text => "org2", :count => 1
  end
end
