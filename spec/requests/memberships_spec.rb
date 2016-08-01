require 'rails_helper'

RSpec.describe "Memberships", type: :request do
  let(:user) { FactoryGirl.create(:user) }
  before{ login_as(user, :scope => :user) }

  describe "GET /memberships" do
    it "works! (now write some real specs)" do
      get memberships_path
      expect(response).to have_http_status(200)
    end
  end
end
