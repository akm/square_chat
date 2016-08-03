# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Organization < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :memberships, dependent: :destroy

  after_create :create_owner_membership
  def create_owner_membership
    return unless User.current_user
    attrs = {
      user: User.current_user,
      role: :owner,
      name: User.current_user.email.split('@',2).first,
      image_url: '/smiley.png'
    }
    memberships.create!(attrs)
  end
end
