class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy last_post]

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
end
