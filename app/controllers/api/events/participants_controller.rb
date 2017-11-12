class Api::Events::ParticipantsController < ApplicationController
  before_action :set_event

  def index
    render json: @event.participants, status: :ok
  end

  def create
    @event.participants << User.find(params[:participant_id].to_i)
    head 201
  end

  def telegram_participants
    @event.participants << User.find_by(telegram_id: params[:telegram_id].to_i)
    render json: @event, serializer: ::EventsSerializer, status: :ok
  end

  private

  def set_event
    @event = Event.find params[:event_id]
  end
end
