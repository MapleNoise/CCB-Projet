class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :nom
      devise_parameter_sanitizer.for(:sign_up) <<:prenom
      devise_parameter_sanitizer.for(:sign_up) <<:email_confirmation
    end
  
    protected
    def authenticate_user
      if session[:user_id]
        # set current user object to @current_user object variable
        @current_user = User.find session[:user_id]
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
  end
