require 'rails_helper'

RSpec.describe "memberships/new", type: :view do
  let(:organization){ FactoryGirl.create(:organization) }
  before(:each) do
    assign(:organization, organization)
    assign(:membership, FactoryGirl.build(:membership, organization: organization))
  end

  it "renders new membership form" do
    render

    assert_select "form[action=?][method=?]", organization_memberships_path(organization), "post" do

      assert_select "input#membership_user_id[name=?]", "membership[user_id]"

      assert_select "input#membership_name[name=?]", "membership[name]"

      assert_select "input#membership_role[name=?]", "membership[role]"
    end
  end
end
