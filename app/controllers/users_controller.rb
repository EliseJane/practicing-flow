class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create]
  before_action :require_user, except: [:new, :create]
  before_action :require_same_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'New user was created!'
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Your profile has been updated'
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if params[:id].to_i != current_user.id
      flash[:notice] = "You can't go there."
      redirect_to root_path
    end
  end
end
