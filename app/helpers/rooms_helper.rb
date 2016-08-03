module RoomsHelper

  MESSAGE_SENT_AT_FORMAT = '%H:%M'.freeze
  def message_sent_at(message)
    message.created_at.strftime(MESSAGE_SENT_AT_FORMAT)
  end
end
