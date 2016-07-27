class Room < ApplicationRecord
  belongs_to :organization, required: true
  has_many :messages, dependent: :destroy
end
