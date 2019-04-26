class Api::UsersController < ApplicationController
  def create
    @user = User.create!(user_params)
    if @user
      login!(@user)
      render json: @user
    else
      render json: "#{@user.errors.full_messages}",  status: 422
    end

  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
