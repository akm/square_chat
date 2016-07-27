class Organization < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :memberships, dependent: :destroy

  after_create :create_owner_membership
  def create_owner_membership
    return unless User.current_user
    memberships.create!(user: User.current_user, role: :owner)
  end
end
