class Api::Users::TopicsController < ApplicationController
  before_action :set_user

  def create
    @user.topics << Topic.where(id: params[:topic_ids].map{ |t| t.to_i })
    head 201
  end

  private

  def set_user
    @user = User.find params[:user_id]
  end
end
