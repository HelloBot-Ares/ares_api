class EventSearch
  def initialize(params)
    @params = params
  end

  def search
    Event.search "*", where: search_params
  end

  private

  def search_params
    {
      location: location_query,
      max_participants: max_participants,
      starting_at: starting_at,
      topic_id: @params[:topic_id].to_i
    }.reject { |k,v| v.nil? || v == "" }
  end

  def starting_at
    @params[:from_date].to_time..@params[:to_date].to_time
  end

  def max_participants
    return nil unless @params[:max_participants]
    return 1..@params[:max_participants]
  end

  def location_query
    return nil unless position
    {
      near: position,
      within: "60km"
    }
  end

  def position
    geo = Geocoder.search(@params[:location])
    if geo.any?
      { lat: geo.first.data["geometry"]["location"]["lat"], lon: geo.first.data["geometry"]["location"]["lng"] }
    end
  end
end
