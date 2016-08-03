class Membership < ApplicationRecord
  extend Enumerize

  belongs_to :organization, required: true
  belongs_to :user, required: true

  ROLE_MAP = {
    :owner  => 1,
    :writer => 2,
    :reader => 3,
  }.freeze
  enumerize :role, in: ROLE_MAP

  def user_email
    user.try(:email)
  end
  def user_email=(value)
    user = User.where(email: value).first
    self.user_id = user.try(:id)
  end
end
