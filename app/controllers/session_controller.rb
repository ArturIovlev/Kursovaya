class SessionController < ApplicationController
  include SessionHelper
  skip_before_action :require_login, only: %i[login create]

  def login; end

  def create
    user = User.find_by_username(params[:username])

    if user&.authenticate(params[:password])

      if user.email_confirmed
        sign_in user
        redirect_to home_url, notice: "Logged in!"
      else
        redirect_to home_url
      end
    else
      flash.now[:danger] = 'Неверный логин или пароль'
      redirect_to session_login_url
    end
  end

  def logout
    sign_out
    redirect_to session_login_url
  end
end
