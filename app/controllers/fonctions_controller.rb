class FonctionsController < ApplicationController
  before_action :set_fonction, only: [:show, :edit, :update, :destroy]
  before_action :acces_juste_admin

  respond_to :html

  def index
    @fonctions = Fonction.all
    respond_with(@fonctions)
  end

  def show
    respond_with(@fonction)
  end

  def new
    @fonction = Fonction.new
    respond_with(@fonction)
  end

  def edit
  end

  def create
    @fonction = Fonction.new(fonction_params)
    @fonction.save
    respond_with(@fonction)
  end

  def update
    @fonction.update(fonction_params)
    respond_with(@fonction)
  end

  def destroy
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
