class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Logged in successfully"
      redirect_to user
    else
      # flash.now since there is no redirect. 'now' makes it to not persist for one full http request.
      flash.now[:alert] = "There was something wrong with your login details"
      render 'new'
    end
  end

  def destroy
  end
end