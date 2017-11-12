class Api::TopicsController < ApplicationController
  def index
    render json: Topic.all.order(:name), status: :ok
  end
end
