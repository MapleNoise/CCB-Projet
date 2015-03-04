class ExtensionFichiersController < ApplicationController
  before_action :set_extension_fichier, only: [:show, :edit, :update, :destroy]

  respond_to :html

  layout :extension_fichiers_layout
  
  @layout = "back"
  
  def extension_fichiers_layout
    @layout
  end
  
  
  def index
    @layout = "back"
    @extension_fichiers = ExtensionFichier.all
    respond_with(@extension_fichiers)
  end

  def show
    @layout = "back"
    respond_with(@extension_fichier)
  end

  def new
    @layout = "back"
    @extension_fichier = ExtensionFichier.new
    respond_with(@extension_fichier)
  end

  def edit
    @layout = "back"
  end

  def create
    @layout = "back"
    @extension_fichier = ExtensionFichier.new(extension_fichier_params)
    @extension_fichier.save
    respond_with(@extension_fichier)
  end

  def update
    @layout = "back"
    @extension_fichier.update(extension_fichier_params)
    respond_with(@extension_fichier)
  end

  def destroy
    @layout = "back"
    @extension_fichier.destroy
    respond_with(@extension_fichier)
  end

  private
    def set_extension_fichier
      @extension_fichier = ExtensionFichier.find(params[:id])
    end

    def extension_fichier_params
      params.require(:extension_fichier).permit(:extension)
    end
end
