class EventsSerializer < ActiveModel::Serializer
  attributes :id, :subject, :place_address, :place_name, :starting_at,
             :max_participants, :owner, :participants, :topic, :starting_at_formatted

  def owner
    object.owner
  end

  def participants
    object.participants
  end

  def topic
    object.topic
  end

  def starting_at_formatted
    object.starting_at.strftime("%d/%m/%Y %H:%M")
  end
end
