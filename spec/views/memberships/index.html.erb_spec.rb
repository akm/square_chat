require 'rails_helper'

RSpec.describe "memberships/index", type: :view do

  let(:user1){ FactoryGirl.create(:user, email: 'user1@example.com') }
  let(:user2){ FactoryGirl.create(:user, email: 'user2@example.com') }

  before(:each) do
    assign(:memberships, [
      FactoryGirl.create(:membership, user: user1, name: 'member1'),
      FactoryGirl.create(:membership, user: user2, name: 'member2'),
    ])
  end

  it "renders a list of memberships" do
    render
    assert_select "tr>td", :text => 'member1', :count => 1
    assert_select "tr>td", :text => 'member2', :count => 1
  end
end
