require 'rails_helper'

RSpec.describe "memberships/show", type: :view do
  before(:each) do
    @membership = assign(:membership, FactoryGirl.create(:membership))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/member1/)
  end
end
