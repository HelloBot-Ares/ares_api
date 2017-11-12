class Api::EventsController < ApplicationController
  def index
    render json: Event.all, each_serializer: ::EventsSerializer, status: :ok
  end

  def search
    events = EventSearch.new(params[:search]).search
    render json: events, each_serializer: ::EventsSerializer, status: :ok
  end
end
