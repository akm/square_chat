require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:user){ FactoryGirl.create(:user) }

  describe :create do
    it "has membetship as owner to current_user" do
      User.current(user) do
        org = Organization.create!(name: 'org1')
        expect(org.memberships.count).to eq 1
        m = org.memberships.first
        expect(m.user_id).to eq user.id
        expect(m.role).to eq 'owner'
      end
    end
  end
end
