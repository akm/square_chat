# == Schema Information
#
# Table name: memberships
#
#  id              :integer          not null, primary key
#  organization_id :integer          not null
#  user_id         :integer          not null
#  name            :string(255)      not null
#  image_url       :string(255)      not null
#  role            :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_memberships_on_organization_id  (organization_id)
#  index_memberships_on_user_id          (user_id)
#

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
