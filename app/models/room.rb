class Room < ApplicationRecord
  belongs_to :organization, required: true
end
