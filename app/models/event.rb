class Event < ApplicationRecord
  validates :subject, :owner_id, :topic_id, :place_address, presence: true

  has_many :event_participants
  has_many :participants, through: :event_participants, source: "user"
end
