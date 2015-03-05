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
    if utilisateur2_params['password'] #Si c'est un utlisateur qui modifie son compte
      
      unless utilisateur2_params['old_password'].empty?
        
        authorized_user = Utilisateur2.find_by(id: session[:user_id])
     
        if authorized_user
          
           authorized_user = authorized_user.authenticate(utilisateur2_params['old_password'])
           
           if authorized_user
             if utilisateur2_params['password'] === utilisateur2_params['password_confirmation']
                @utilisateur2.update(utilisateur2_params)
             else
               @utilisateur2.errors.add(:password_confirmation, "Confirmation password incorrect")
               respond_with(@utilisateur2) do |format|
                  format.html { render 'modifierUtilisateur' }
                end
             end
           else #l'utilisateur se trompe de mdp
             @utilisateur2.errors.add(:old_password, "Incorect password")
            respond_with(@utilisateur2) do |format|
              format.html { render 'modifierUtilisateur' }
            end
           end
        end
      else 
        @utilisateur2.nom =  utilisateur2_params['nom']
        @utilisateur2.prenom = utilisateur2_params['prenom']
        @utilisateur2.save
      end
        
     
    else #Si c'est un admin qui change le role d'un utilisateur
        @utilisateur2.update(utilisateur2_params)
        @utilisateur2.fonctionId = fonction_params
        @utilisateur2.save
        respond_with(@utilisateur2)
    end
  end
  
  
  def destroy
    @utilisateur2.destroy
    respond_with(@utilisateur2)
  end

  def MapSite
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
