class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
    	log_in @user
      flash[:success] = "User was created"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
  	@user.destroy
  	log_out
  	redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,:role,
                                   :password_confirmation)
    end
end
