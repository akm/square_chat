# == Schema Information
#
# Table name: rooms
#
#  id              :integer          not null, primary key
#  organization_id :integer          not null
#  name            :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_rooms_on_organization_id  (organization_id)
#

FactoryGirl.define do
  factory :room do
    association :organization, factory: :organization
    name "general"
  end
end
