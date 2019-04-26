class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login!(@user)
      redirect_to '/'
    else
      render json: "Invalid Credentials #{@user.errors.full_messages}", status: 401 
    end
  end

  def destroy
    if current_user
      logout!
      render json: {}
    else
      render json: "No Current User to logout dumdum", status: 404
    end
  end

   def user_params
    params.require(:user).permit(:username, :password)
  end
end
