class Message < ApplicationRecord
  belongs_to :room, required: true
  belongs_to :user, required: true
  after_create_commit { MessageBroadcastJob.perform_later self }
end
