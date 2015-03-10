class FonctionsController < ApplicationController
  before_action :set_fonction, only: [:show, :edit, :update, :destroy]
  before_action :acces_juste_admin

  respond_to :html

  layout :fonctions_layout
  
  @layout = "back"
  
  def fonctions_layout
    @layout
  end
  
  
  def index
    @layout = "back"
    @fonctions = Fonction.all
    respond_with(@fonctions)
  end

  def show
    @layout = "back"
    respond_with(@fonction)
  end

  def new
    @layout = "back"
    @fonction = Fonction.new
    respond_with(@fonction)
  end

  def edit
    @layout = "back"
  end

  def create
    @layout = "back"
    @fonction = Fonction.new(fonction_params)
    @fonction.save
    respond_with(@fonction)
  end

  def update
    @layout = "back"
    @fonction.update(fonction_params)
    respond_with(@fonction)
  end

  def destroy
    @layout = "back"
    @fonction.destroy
    respond_with(@fonction)
  end

  private
    def set_fonction
      @fonction = Fonction.find(params[:id])
    end

    def fonction_params
      params.require(:fonction).permit(:nom)
    end
end
