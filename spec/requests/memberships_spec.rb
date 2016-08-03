require 'rails_helper'

RSpec.describe "Memberships", type: :request do
  let(:organization) { FactoryGirl.create(:organization) }
  let(:user) { FactoryGirl.create(:user) }
  before{ login_as(user, :scope => :user) }

  describe "GET /memberships" do
    it "works! (now write some real specs)" do
      get organization_memberships_path(organization)
      expect(response).to have_http_status(200)
    end
  end
end
