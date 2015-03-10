class ExtensionFichiersController < ApplicationController
  before_action :set_extension_fichier, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @extension_fichiers = ExtensionFichier.all
    respond_with(@extension_fichiers)
  end

  def show
    respond_with(@extension_fichier)
  end

  def new
    @extension_fichier = ExtensionFichier.new
    respond_with(@extension_fichier)
  end

  def edit
  end

  def create
    @extension_fichier = ExtensionFichier.new(extension_fichier_params)
    @extension_fichier.save
    respond_with(@extension_fichier)
  end

  def update
    @extension_fichier.update(extension_fichier_params)
    respond_with(@extension_fichier)
  end

  def destroy
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
