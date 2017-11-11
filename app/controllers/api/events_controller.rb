class Api::EventsController < ApplicationController
  def create
    event = Event.new event_params
    if event.save
      render json: event, status: :ok
    else
      render json: {errors: event.errors}, status: 400
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :subject, :owner_id, :starting_at, :place_name, :place_address, :topic_id
    )
  end
end
