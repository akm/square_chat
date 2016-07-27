class Organization < ApplicationRecord
  has_many :rooms, dependent: :destroy
end
