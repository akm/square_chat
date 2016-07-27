require 'rails_helper'

RSpec.describe "organizations/index", type: :view do
  before(:each) do
    assign(:organizations, [
      FactoryGirl.create(:organization),
      FactoryGirl.create(:organization),
    ])
  end

  it "renders a list of organizations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
