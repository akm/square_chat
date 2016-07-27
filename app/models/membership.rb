class Membership < ApplicationRecord
  belongs_to :organization, required: true
  belongs_to :user, required: true
end
