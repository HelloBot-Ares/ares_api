class Api::TelegramEventsController < ApplicationController
  def create
    event = Event.new
    event.subject = params[:event][:subject]
    event.topic_id = params[:event][:topic_id].to_i
    event.starting_at = Time.now + [1, 2, 3].sample.days
    event.place_name = params[:event][:place_name]
    event.place_address = "Via rosselli, 101, 13900 Biella BI"
    event.max_participants = [3, 6, 12].sample
    event.owner_id = User.find_by(telegram_id: params[:event][:telegram_id]).id

    if event.save
      render json: event, serializer: ::EventsSerializer, status: :ok
    else
      render json: {errors: event.errors}, status: 400
    end
  end
end
