class Api::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: {user: user}, status: :ok
    else
      render json: {errors: user.errors}, status: 400
    end
  end

  def signin
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
