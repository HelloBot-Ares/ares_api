class Event < ApplicationRecord
  validates :subject, :owner_id, :topic_id, :place_address, presence: true
end
