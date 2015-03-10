class Utilisateur2sController < ApplicationController
  before_action :set_utilisateur2, only: [:show, :edit, :update, :destroy, :modifierUtilisateur]

  respond_to :html

   layout :utilisateur2s_layout
  
  @layout = "back"
  
  def utilisateur2s_layout
    @layout
  end
  
  
  def index

    @layout = "back"
    if(session[:user_id] != nil && Utilisateur2.find_by(id: session[:user_id]).isAdmin?)
      @utilisateur2s = Utilisateur2.all
      if params[:nom].present?
        @utilisateur2s = Utilisateur2.where('nom LIKE ?', params[:nom] + "%")
      end
      if params[:prenom].present?
        @utilisateur2s = Utilisateur2.where('prenom LIKE ?', params[:prenom] + "%")
      end
      if params[:email].present?
        @utilisateur2s = Utilisateur2.where('email LIKE ?'  ,   params[:email] + "%")
      end
      if params[:nom].present? && params[:prenom].present?
        @utilisateur2s = Utilisateur2.where('nom LIKE ?', params[:nom] + "%").where('prenom LIKE ?', params[:prenom] + "%")
      end
      if params[:nom].present? && params[:email].present?
        @utilisateur2s = Utilisateur2.where('nom LIKE ?', params[:nom] + "%").where('email LIKE ?', params[:email] + "%")
      end
      if params[:prenom].present? && params[:email].present?
        @utilisateur2s = Utilisateur2.where('prenom LIKE ?', params[:prenom] + "%").where('email LIKE ?', params[:email] + "%")
      end
      if params[:nom].present? && params[:prenom].present? && params[:email].present?
        @utilisateur2s = Utilisateur2.where('nom LIKE ?', params[:nom] + "%").where('prenom LIKE ?', params[:prenom] + "%").where('email LIKE ?', params[:email] + "%")
      end
      respond_with(@utilisateur2s)
    else
      @utilisateur2s = Utilisateur2.find_by(id: session[:user_id])
      respond_with(@utilisateur2s)
      #redirect_to forbidden_path :status => 403
    end
  end

  def show
    if(!session[:user_id].nil?)
     if( Utilisateur2.find_by(id: session[:user_id]).isAdmin?)
      @layout = "application"
      @utilisateur2s = Utilisateur2.all
      respond_with(@utilisateur2s)
    else
      if(prod_id_params != {})
        redirect_to produit/prod_id_params/achat
      end
      @utilisateur2 = Utilisateur2.find_by(id: session[:user_id])
      respond_with(@utilisateur2)

    #else
    #  redirect_to forbidden_path :status => 403
    end
  end
  end

  def new

    ##if(session[:user_id] == nil || Utilisateur2.find_by(id: session[:user_id]).isAdmin?)
    @layout = "application"
      @utilisateur2 = Utilisateur2.new
      respond_with(@utilisateur2, @produit)
    ##else
      ##redirect_to forbidden_path :status => 403
    ##end
  end

  def edit
    @layout = "back"
  end

  def afficherMonProfil
    @utilisateur2 = Utilisateur2.find_by(id: session[:user_id])
    respond_with(@utilisateur2)
  end
  
  def modifierUtilisateur
    @layout = "back"
  end

  def create
    @layout = "back"
    @utilisateur2 = Utilisateur2.new(utilisateur2_params)
    @utilisateur2.fonctionId = fonction_params
    @utilisateur2.save

    session[:user_id] = @utilisateur2.id

    if(prod_id_params == {})
      respond_with(@utilisateur2)
    else
      @prod = Produit.all.find_by(:id => prod_id_params)
      if(!@prod.nil?)
        redirect_to "/achat/#{@prod.id}"
      else
        respond_with(@utilisateur2)
      end
    end
  end

  def update
    @layout = "back"

    if utilisateur2_params['password'] #Si c'est un utilisateur qui modifie son compte
      
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
        
     
    elsif(Utilisateur2.find_by(id: session[:user_id]).isAdmin?) #Si c'est un admin qui change le role d'un utilisateur
        @utilisateur2.update(utilisateur2_params)
        @utilisateur2.fonctionId = fonction_params
        @utilisateur2.save
        respond_with(@utilisateur2)
    end
  end
  
  
  def destroy
    @layout = "back"
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
      params.require(:utilisateur2).permit(:nom, :prenom, :email, :email_confirmation, :password, :password_confirmation, :old_password, :prod, :produit)
    end

    
    def fonction_params
      params.require(:fonctions)
    end

    def prod_id_params
      if(params[:prod] == nil || params[:prod] == "")
        {}
      else
        params.require(:prod)
      end
    end    
end
