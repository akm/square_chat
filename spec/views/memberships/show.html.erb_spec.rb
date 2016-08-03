require 'rails_helper'

RSpec.describe "memberships/show", type: :view do
  let(:organization){ FactoryGirl.create(:organization) }
  before(:each) do
    assign(:organization, organization)
    @membership = assign(:membership, FactoryGirl.create(:membership, organization: organization))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/member1/)
  end
end
