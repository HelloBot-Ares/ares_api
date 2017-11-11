class Api::EventsController < ApplicationController
  def index
    render json: Event.all, status: :ok
  end

  def search
    events = EventSearch.new(params[:search]).search
    render json: events, status: :ok
  end
end
