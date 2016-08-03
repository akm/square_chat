FactoryGirl.define do
  factory :message do
    association :room, factory: :room
    association :membership, factory: :membership
    content "Message1"
  end
end
