# coding: utf-8
class Utilisateur2sController < ApplicationController
  before_action :set_utilisateur2, only: [:show, :edit, :update, :destroy, :modifierUtilisateur]

  respond_to :html

   layout :utilisateur2s_layout
  
  @layout = "back"
  
  helper_method :sort_column, :sort_direction
  def utilisateur2s_layout
    @layout
  end
  
  
  def index
        @layout = "back"
    if(session[:user_id] != nil && Utilisateur2.find_by(id: session[:user_id]).isAdmin?)

      respond_with(user_filtered)
    else
      redirect_to forbidden_path :status => 403
    end
  end

  def user_filtered
    @utilisateur2s = Utilisateur2.all.order(sort_column + " " + sort_direction)
    if params[:nom].present?
      @utilisateur2s = @utilisateur2s.where('nom LIKE ?', '%' + params[:nom] + '%').order(sort_column + " " + sort_direction)
    end
    if params[:prenom].present?
      @utilisateur2s = @utilisateur2s.where('prenom LIKE ?', '%' + params[:prenom] + '%').order(sort_column + " " + sort_direction)
    end
    if params[:email].present?
      @utilisateur2s = @utilisateur2s.where('email LIKE ?', '%' + params[:email] + '%').order(sort_column + " " + sort_direction)
    end
  end

  def show
    @layout = "back"

    if(session[:user_id] != nil && Utilisateur2.find_by(id: session[:user_id]).isAdmin?)
      @utilisateur2s = Utilisateur2.all
      respond_with(@utilisateur2s)
    else
      redirect_to forbidden_path :status => 403
    end
  end

	def inscription
    @layout = "application"
    if(session[:user_id] == nil)
      @utilisateur2 = Utilisateur2.new
      respond_with(@utilisateur2)
    else
      redirect_to forbidden_path :status => 403
    end
  end

  def new
    @layout = "back"
    if(session[:user_id] == nil || Utilisateur2.find_by(id: session[:user_id]).isAdmin?)
      @utilisateur2 = Utilisateur2.new
      respond_with(@utilisateur2)
    else
      redirect_to forbidden_path :status => 403
    end
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

  	if (session[:user_id] != nil && Utilisateur2.find_by(id: session[:user_id]).isAdmin?)
	    @layout = "back"
	    @utilisateur2 = Utilisateur2.new(utilisateur2_params)
	    @utilisateur2.fonctionId = fonction_params
	    
	    if @utilisateur2.save
	    	flash[:notice] = "Création d'utilisateur terminée"
	    	respond_with(@utilisateur2)
	    else
	    	flash[:error] = "Problème lors de la communication avec la base de données."
	    	render 'new'
	    end
	  else
	    @utilisateur2 = Utilisateur2.new(utilisateur2_params)
	    @utilisateur2.fonctionId = fonction_params
	    @utilisateur2.save
	  	redirect_to root_path, notice: 'Inscription terminée.'
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
      params.require(:utilisateur2).permit(:nom, :prenom, :email, :email_confirmation, :password, :password_confirmation, :old_password)
    end

    def fonction_params
      params.require(:fonctions)
    end

    def sort_column
      if Utilisateur2.column_names.include?(params[:sort])
        params[:sort]
      else
        "nom"
      end
    end

    def sort_direction
      if %w[asc desc].include?(params[:direction])
        params[:direction]
      else
        "asc"
      end
    end

    
    def fonction_params
      params.require(:fonctions)
    end
    
end
