class Api::EventsController < ApplicationController
  def index
    render json: Event.all, status: :ok
  end
end
