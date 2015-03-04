class Utilisateur2sController < ApplicationController
  before_action :set_utilisateur2, only: [:show, :edit, :update, :destroy, :modifierUtilisateur]

  respond_to :html

  def index
    @utilisateur2s = Utilisateur2.all
    respond_with(@utilisateur2s)
  end

  def show
    respond_with(@utilisateur2)
  end

  def new
    @utilisateur2 = Utilisateur2.new
    respond_with(@utilisateur2)
  end

  def edit
  end


  def create
    @utilisateur2 = Utilisateur2.new(utilisateur2_params)
    @utilisateur2.fonctionId = fonction_params
    @utilisateur2.save
    respond_with(@utilisateur2)
  end

  def update  
    if utilisateur2_params['password']
     #@utilisateur2.update(utilisateur2_params)
     authorized_user = Utilisateur2.find_by(id: session[:id])
     if authorized_user
        authorized_user = authorized_user.authenticate(params[:login_password])
        puts "///////////////////////////////////"
     end
     
     if authorized_user
       puts "///////////////////////////////////////"
        #@utilisateur2.update(utilisateur2_params)
     end
     #@utilisateur2.save
    else 
     #@utilisateur2.update(utilisateur2_params)
     #@utilisateur2.fonctionId = fonction_params
     #@utilisateur2.save
    end
    respond_with(@utilisateur2)
  end

  def destroy
    @utilisateur2.destroy
    respond_with(@utilisateur2)
  end

  private
    def set_utilisateur2
      @utilisateur2 = Utilisateur2.find(params[:id])
    end

    def utilisateur2_params
      params.require(:utilisateur2).permit(:nom, :prenom, :email, :email_confirmation, :password, :password_confirmation, :old_password)
    end

    
    def fonction_params
      params.require(:fonctions)
    end
end
