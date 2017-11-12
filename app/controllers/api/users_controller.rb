class Api::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: {user: user}, status: :ok
    else
      render json: {errors: user.errors}, status: 400
    end
  end

  def by_telegram_id
    unless params[:telegram_id].present?
      render json: {error: "User not found"}, status: 400
      return
    end
    user = User.where(telegram_id: params[:telegram_id]).first
    if user
      render json: user, status: :ok
    else
      head :not_found
    end
  end

  def set_telegram_id
    id = params[:id]
    user = User.where(id: id).first
    unless user
      render json: {errors: "User not found"}, status: :not_found
      return
    end

    unless params[:telegram_id]
      render json: {error: "Telegram ID not provided"}, status: 400
      return
    end
    telegram_id = params[:telegram_id]
    if user.update(telegram_id: telegram_id)
      render json: user, status: :ok
    else
      render json: {errors: user.errors}, status: 400
    end
  end

  def signin
    puts params.inspect
    user = User.where(username: params[:user][:username], password: params[:user][:password]).first
    if user
      render json: user, status: :ok
    else
      head :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :city)
  end
end
