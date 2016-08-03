# == Schema Information
#
# Table name: memberships
#
#  id              :integer          not null, primary key
#  organization_id :integer          not null
#  user_id         :integer          not null
#  name            :string(255)      not null
#  role            :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_memberships_on_organization_id  (organization_id)
#  index_memberships_on_user_id          (user_id)
#

FactoryGirl.define do
  factory :membership do
    association :organization, factory: :organization
    association :user, factory: :user
    name 'member1'
    role 1
  end
end
