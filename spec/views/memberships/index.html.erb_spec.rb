require 'rails_helper'

RSpec.describe "memberships/index", type: :view do

  let(:organization){ FactoryGirl.create(:organization) }
  let(:user1){ FactoryGirl.create(:user, email: 'user1@example.com') }
  let(:user2){ FactoryGirl.create(:user, email: 'user2@example.com') }

  before(:each) do
    assign(:organization, organization)
    memberships = [
      FactoryGirl.create(:membership, user: user1, name: 'member1', organization: organization),
      FactoryGirl.create(:membership, user: user2, name: 'member2', organization: organization),
    ]
    query = double(:query)
    expect(query).to receive(:includes).with(:user).and_return(memberships)
    assign(:memberships, query)
  end

  it "renders a list of memberships" do
    render
    assert_select "tr>td", :text => 'member1', :count => 1
    assert_select "tr>td", :text => 'member2', :count => 1
  end
end
