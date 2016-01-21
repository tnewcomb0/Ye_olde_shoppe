class UsersController < ApplicationController
  def index
    current_user
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      set_message('You did not supply the correct credentials, please try again')
      redirect_to '/users/new'
    end
  end



  def new
    current_user
  end

  def edit
    current_user
    @user = User.find(params[:id])
  end

  def show
    current_user
  end

  def update
    current_user
    if params[:user].include?(:admin)
      if @admin
        user = User.find(params[:id])
        user.update_attributes(admin: params[:user][:admin])
        redirect_to "/users"
      end
    else
    @current_user.update(user_params)
    @current_user.save
    session[:user_id] = @user.id
    redirect_to @user
    end
  end

  def destroy
    current_user
    user = User.find_by(email: params[:email])
    user.destroy if @current_user = user
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end
end




