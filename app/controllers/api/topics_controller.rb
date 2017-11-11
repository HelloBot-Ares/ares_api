class Api::TopicsController < ApplicationController
  def index
    render json: Topic.all, status: :ok
  end
end
