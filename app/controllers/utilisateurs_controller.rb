class UtilisateursController < ApplicationController
  #load_and_authorize_resource :through => :current_user
  # GET /utilisateurs
  # GET /utilisateurs.json
  def index
    #@utilisateurs = Utilisateur.exclude?(:id => current_utilisateur.id)
    @utilisateurs = Utilisateur.all
  end
  
  # GET /utilisateurs/1
  # GET /utilisateurs/1.json
  def show
    @utilisateur = Utilisateur.find(params[:id])
  end
  
  def new
    @utilisateur = Utilisateur.new
    
    
    #if @utilisateur.save
      #    format.html { redirect_to @utilisateur, notice: 'User was successfully created.' }
      #    format.json { render :show, status: :created, location: @utilisateur }
      #  end
    end
  
  def create
    @utilisateur = Utilisateur.new(params[:utilisateur])
    if @utilisateur.save
      flash[:notice] = "Successfully created User." 
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
  
  # GET /utilisateurs/1/edit
  def edit
    @utilisateur = Utilisateur.find(params[:id])
  end
  
  # PATCH/PUT /utilisateurs/1
  # PATCH/PUT /utilisateurs/1.json
  def update
  @utilisateur = Utilisateur.find(params[:id])
 
  if @utilisateur.update(utilisateur_params)
    redirect_to @utilisateur
  else
    render 'edit'
  end
end

  def destroy
  @utilisateur = Utilisateur.find(params[:id])
  @utilisateur.destroy
 
  redirect_to utilisateurs_path
end
 
private
  def utilisateur_params
    params.require(:utilisateur).permit(:email, :email_confirmation, :encrypted_password, :nom, :prenom, :dateCreation, :dateModification)
  end
  
  
  protected 
  
   def after_sign_up_path_for(resource)
     redirect_to utilisateurs_path
   end
   
   def after_sign_in_path_for(resource)
     redirect_to utilisateurs_path
   end
end
