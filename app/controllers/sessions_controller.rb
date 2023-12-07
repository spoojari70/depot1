class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
     @user = User.find_by(email: params[:email])

     if @user && @user.valid_password?(params[:password])
      sign_in(@user)
      redirect_to admin_url
     else
       redirect_to login_url, alert: "Invalid user/password combination"
     end
  end

  def destroy
    sign_out(@user)
    redirect_to store_index_url, notice: "Logged out"
  end
end
