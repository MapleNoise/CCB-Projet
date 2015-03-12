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
  		  if(prod_id_params != {})
          	redirect_to "/achat/#{prod_id_params}"
      	else
          	redirect_to root_path
  	    end
      else
        redirect_to "/indexBack"
      end
    else
      flash[:error] = "Cette combinaison email/mot de passe n'est pas valide"
      redirect_to login_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def prod_id_params
      if(params[:prod] == nil || params[:prod] == "")
        {}
      else
        params.require(:prod)
      end
    end    
end
