require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  let(:user) { FactoryGirl.create(:user) }
  let(:organization){ FactoryGirl.create(:organization) }
  before{ login_as(user, :scope => :user) }

  describe "GET /organizations/:organization_id/rooms" do
    it "works! (now write some real specs)" do
      get organization_rooms_path(organization)
      expect(response).to have_http_status(200)
    end
  end
end
