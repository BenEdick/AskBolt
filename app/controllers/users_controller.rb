class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "User Created!"
      sign_in @user
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @states = State.all
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash.notice = "User has been updated"
      redirect_to users_url
    else
      render "edit"
    end
  end


  private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :dob, :street_address, :state, :city)
  end

end
