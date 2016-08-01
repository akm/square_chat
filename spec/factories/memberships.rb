FactoryGirl.define do
  factory :membership do
    association :organization, factory: :organization
    association :user, factory: :user
    name 'member1'
    role 1
  end
end
