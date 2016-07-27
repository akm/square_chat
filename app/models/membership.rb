class Membership < ApplicationRecord
  belongs_to :organization, required: true
  belongs_to :user, required: true

  ROLE_MAP = {
    'owner'  => 1,
    'writer' => 2,
    'reader' => 3,
  }.freeze
  enum role: ROLE_MAP
end
