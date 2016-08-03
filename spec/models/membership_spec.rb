# coding: utf-8
# == Schema Information
#
# Table name: memberships
#
#  id              :integer          not null, primary key
#  organization_id :integer          not null
#  user_id         :integer          not null
#  name            :string(255)      not null
#  image_url       :string(255)      not null
#  role            :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_memberships_on_organization_id  (organization_id)
#  index_memberships_on_user_id          (user_id)
#

require 'rails_helper'

RSpec.describe Membership, type: :model do
  describe :role do
    context :owner do
      context :writer do
        let(:membership){ Membership.new }
        it{ membership.role = 1 }
        it{ membership.role = '1' }
        it{ membership.role = :owner }
        it{ membership.role = 'owner' }
      end
      context :assign do
        let(:membership){ @membership }
        it{ @membership = Membership.new(role: 1) }
        it{ @membership = Membership.new(role: '1') }
        it{ @membership = Membership.new(role: :owner) }
        it{ @membership = Membership.new(role: 'owner') }
      end
      after{ expect(membership.role).to eq 'owner' }
    end
    context :writer do
      context :writer do
        let(:membership){ Membership.new }
        it{ membership.role = 2 }
        it{ membership.role = '2' }
        it{ membership.role = :writer }
        it{ membership.role = 'writer' }
      end
      after{ expect(membership.role).to eq 'writer' }
    end
    context :reader do
      context :owner do
        let(:membership){ Membership.new(role: 1) }
        it{ expect(membership.role == 1      ).to be_truthy }
        it{ expect(membership.role_before_type_cast == 1).to be_truthy }
        it{ expect(membership.role == '1'    ).to be_falsy  }
        it{ expect(membership.role == 'owner').to be_truthy }
        it{ expect(membership.role == :owner ).to be_truthy }
        it{ expect(membership.role == 2       ).to be_falsy }
        it{ expect(membership.role == '2'     ).to be_falsy }
        it{ expect(membership.role == 'writer').to be_falsy }
        it{ expect(membership.role == :writer ).to be_falsy }
      end
    end
  end

  describe :user_email do
    let(:org){ FactoryGirl.create(:organization) }
    let(:user1){ FactoryGirl.create(:user, email: 'user1@example.com') }
    let(:user2){ FactoryGirl.create(:user, email: 'user2@example.com') }
    let(:user3){ FactoryGirl.create(:user, email: 'user3@example.com') }
    let(:membership1){ FactoryGirl.create(:membership, organization: org, user: user1) }
    it{ expect(membership1.user_email).to eq user1.email }
    it{ expect(Membership.new.user_email).to eq nil }

    it "on create" do
      user1 # to load
      user2 # to load
      attrs = FactoryGirl.attributes_for(:membership)
      attrs.update(organization: org, user_email: user2.email)
      membership = Membership.create!(attrs)
      expect(membership.user_id).to eq user2.id
    end

    it "on update" do
      user1 # to load
      user2 # to load
      membership1 # to load
      membership2 = FactoryGirl.create(:membership, organization: org, user: user2)
      membership2.update!(user_email: user3.email)
      expect(membership2.user_id).to eq user3.id
    end
  end
end
