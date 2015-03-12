class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def authenticate_user
    if session[:user_id]
      # set current user object to @current_user object variable
      @current_user = Utilisateur2.find_by(id: session[:user_id])
    return true
    else
      redirect_to(:controller => 'sessions', :action => 'login')
    return false
    end
  end

  def save_login_state
    if session[:user_id]
      redirect_to(:controller => 'sessions', :action => 'home')
    return false
    else
    return true
    end
  end

#Autorise l'affichage de la page uniquement si l'utilisateur est un Expert ou un Admin
  def test_client
    if(session[:user_id] == nil || Utilisateur2.find_by(:id => session[:user_id]).isClient?)
      redirect_to forbidden_path :status => 403
      false
    else
      true
    end 
  end

  #Autorise l'affichage de la page uniquement si l'utilisateur est un Admin
  def test_expert
    if(session[:user_id] == nil || Utilisateur2.find_by(:id => session[:user_id]).isExpert?)
      redirect_to forbidden_path :status => 403
      false
    else
      true
    end
  end

#Autorise l'affichage de la page uniquement si l'utilisateur est un Admin
  def test_admin
    if(session[:user_id] == nil || !(Utilisateur2.find_by(:id => session[:user_id]).isAdmin?))
      redirect_to forbidden_path :status => 403
      false
    else
      true
    end
  end

  def acces_juste_admin
    if(session[:user_id] == nil || !(Utilisateur2.find_by(:id => session[:user_id]).isAdmin?))
      redirect_to forbidden_path :status => 403
      false
    else
      true
    end
  end

end
