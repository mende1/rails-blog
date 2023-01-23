class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_user, only: %i[edit update destroy]
  before_action :require_same_user, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: user_feedback('created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: user_feedback('updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil

    redirect_to users_path, status: :see_other, notice: user_feedback('destroyed')
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_feedback(action_msg)
    "User was successfully #{action_msg}"
  end

  def require_same_user
    return unless current_user != @user

    flash[:error] = 'You do not have permission to edit this user'
    redirect_to @user
  end
end
