module MembershipValidation
  extend ActiveSupport::Concern

  included do
    validates :organization_id, presence: true, numericality: true
    validates :user_id, presence: true, numericality: true
    validates :name, presence: true
    validates :role, presence: true, numericality: true
  end
end
