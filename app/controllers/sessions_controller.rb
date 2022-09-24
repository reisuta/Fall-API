class SessionsController < ApplicationController
  skip_before_action :check_logged_in, only: [:new, :create, :google_auth]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  def google_auth
    if (user = User.find_or_create_from_auth_hash(auth_hash))
      log_in user
    end
    redirect_to root_path
  end

  private
    def auth_hash
      request.env['omniauth.auth']
    end
end
