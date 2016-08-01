require 'rails_helper'

RSpec.describe "memberships/edit", type: :view do
  before(:each) do
    @membership = assign(:membership, FactoryGirl.create(:membership))
  end

  it "renders the edit membership form" do
    render

    assert_select "form[action=?][method=?]", membership_path(@membership), "post" do

      assert_select "input#membership_organization_id[name=?]", "membership[organization_id]"

      assert_select "input#membership_user_id[name=?]", "membership[user_id]"

      assert_select "input#membership_name[name=?]", "membership[name]"

      assert_select "input#membership_role[name=?]", "membership[role]"
    end
  end
end
