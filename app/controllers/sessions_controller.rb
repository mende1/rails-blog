class SessionsController < ApplicationController
  before_action :set_user, only: [:create]

  def new; end

  def create
    if @user&.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user, notice: 'Logged in successfully'
    else
      flash.now[:error] = 'Invalid username or password'
      render :new, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end

  private

  def email_or_username(username)
    return 'username' if (username =~ URI::MailTo::EMAIL_REGEXP).nil?

    'email'
  end

  def set_user
    username = params[:session][:username]
    @user = User.find_by("#{email_or_username(username)}": username)
  end
end
