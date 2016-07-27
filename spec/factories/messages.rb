FactoryGirl.define do
  factory :message do
    association :room, factory: :room
    association :user, factory: :user
    content "Message1"
  end
end
