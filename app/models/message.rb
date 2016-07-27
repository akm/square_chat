class Message < ApplicationRecord
  belongs_to :room, required: true
  belongs_to :user, required: true
end
