require 'rails_helper'

RSpec.describe "organizations/show", type: :view do
  before(:each) do
    @organization = assign(:organization, FactoryGirl.create(:organization))
    @rooms = assign(:rooms, [FactoryGirl.create(:room, organization: @organization)])
  end

  it "renders attributes in <p>" do
    render
    # Nothing to check
  end
end
