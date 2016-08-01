require 'rails_helper'

RSpec.describe "memberships/new", type: :view do
  before(:each) do
    assign(:membership, FactoryGirl.build(:membership))
  end

  it "renders new membership form" do
    render

    assert_select "form[action=?][method=?]", memberships_path, "post" do

      assert_select "input#membership_organization_id[name=?]", "membership[organization_id]"

      assert_select "input#membership_user_id[name=?]", "membership[user_id]"

      assert_select "input#membership_name[name=?]", "membership[name]"

      assert_select "input#membership_role[name=?]", "membership[role]"
    end
  end
end
