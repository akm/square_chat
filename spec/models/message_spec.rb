# == Schema Information
#
# Table name: messages
#
#  id            :integer          not null, primary key
#  room_id       :integer          not null
#  membership_id :integer          not null
#  content       :text(65535)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_messages_on_membership_id  (membership_id)
#  index_messages_on_room_id        (room_id)
#

require 'rails_helper'

RSpec.describe Message, type: :model do
end
