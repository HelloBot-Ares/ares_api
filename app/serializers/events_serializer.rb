class EventsSerializer < ActiveModel::Serializer
  attributes :id, :subject, :place_address, :place_name, :starting_at,
             :max_participants, :owner, :participants, :topic

  def owner
    object.owner
  end

  def participants
    object.participants
  end

  def topic
    object.topic
  end
end
