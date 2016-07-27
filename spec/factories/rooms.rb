FactoryGirl.define do
  factory :room do
    association :organization, factory: :organization
    name "general"
  end
end
