require 'rails_helper'

RSpec.describe "rooms/show", type: :view do
  include Devise::Test::ControllerHelpers

  let(:user){ FactoryGirl.create(:user) }
  let(:organization){ FactoryGirl.create(:organization) }
  before(:each) do
    assign(:organization, organization)
    @room = assign(:room, FactoryGirl.create(:room, organization: organization))
    @messages = assign(:messages, [FactoryGirl.create(:message, room: @room, user: user)])
  end
  around{|ex| User.current(user){ ex.run } }

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
  end
end
