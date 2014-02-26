class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #Success login
      sign_in user
      redirect_to user
    else
      #Error message
      flash.now[:error] = "Invalid email/password combination<p>User: #{user}"
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:message] = "Signed out"
    redirect_to root_url
  end
end
