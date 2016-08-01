class Membership < ApplicationRecord
  belongs_to :organization, required: true
  belongs_to :user, required: true

  ROLE_MAP = {
    'owner'  => 1,
    'writer' => 2,
    'reader' => 3,
  }.freeze
  enum role: ROLE_MAP

  ROLE_VALUE_STRS = ROLE_MAP.values.map(&:to_s).freeze
  def role=(value)
    value = value.to_i if ROLE_VALUE_STRS.include?(value)
    super(value)
  end
end
