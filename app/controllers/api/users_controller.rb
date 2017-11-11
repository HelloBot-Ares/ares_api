class Api::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: {user: user}, status: :ok
    else
      render json: {errors: user.errors}, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :city)
  end

end
