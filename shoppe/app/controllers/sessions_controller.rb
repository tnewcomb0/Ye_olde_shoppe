class SessionsController < ApplicationController

  # Display login form
  def new
    current_user
  end

  #POST login form
  def create
    user = User.find_by(email: params[:session][:email])
    user.authenticate(params[:session][:password])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      # flash.now.alert = "Invalid email or password"
      render "new"
    end

  end

  #DELETE / logout route
  def destroy
    current_user
    reset_session
    redirect_to :root
  end

end
