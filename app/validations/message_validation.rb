module MessageValidation
  extend ActiveSupport::Concern

  included do
    validates :room_id, presence: true, numericality: true
    validates :user_id, presence: true, numericality: true
  end
end
