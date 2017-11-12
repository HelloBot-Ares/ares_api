class Event < ApplicationRecord
  searchkick locations: ["location"]

  def search_data
    custom_attrs = {
      max_participants: max_participants,
      starting_at: starting_at,
      topic_id: topic_id,
      location: { lat: latitude, lon: longitude }
    }
    attributes.merge custom_attrs
  end

  geocoded_by :place_address
  after_validation :geocode

  validates :subject, :owner_id, :topic_id, :place_address, presence: true

  has_many :event_participants
  has_many :participants, through: :event_participants, source: "user"

  belongs_to :owner, class_name: "User"

  belongs_to :topic
end
