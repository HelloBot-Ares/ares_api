class Api::Users::EventsController < ApplicationController
  before_action :set_user, only: [:index]

  def create
    event = Event.new event_params
    if event.save
      render json: event, serializer: ::EventsSerializer, status: :ok
    else
      render json: {errors: event.errors}, status: 400
    end
  end

  def index
    render json: @user.all_events, each_serializer: ::EventsSerializer, status: :ok
  end

  private

  def set_user
    if request_from_telegram
      @user = User.where telegram_id: params[:user_id]
      return
    end
    @user = User.find params[:user_id]
  end

  def event_params
    params.require(:event).permit(
      :subject, :owner_id, :starting_at, :place_name, :place_address,
      :topic_id, :max_participants
    )
  end
end
