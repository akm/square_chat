module RoomValidation
  extend ActiveSupport::Concern

  included do
    validates :organization_id, presence: true, numericality: true
    validates :name, presence: true
  end
end
