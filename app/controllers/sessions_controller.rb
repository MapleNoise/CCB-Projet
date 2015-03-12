class SessionsController < ApplicationController

  before_filter :authenticate_user, :only => [:home, :profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]

  def login
    #Login Form
  end

  def login_attempt

    authorized_user = Utilisateur2.find_by(email: params[:email].downcase)
    if authorized_user
      authorized_user = authorized_user.authenticate(params[:login_password])
    end

    if authorized_user
      session[:user_id] = authorized_user.id

      if authorized_user.isClient?
        redirect_to root_path
      else
        redirect_to "/indexBack"
      end
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      redirect_to login_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end
