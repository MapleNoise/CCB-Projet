class Utilisateur2sController < ApplicationController
  before_action :set_utilisateur2, only: [:show, :edit, :update, :destroy]

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
    @utilisateur2.update(utilisateur2_params)
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
      params.require(:utilisateur2).permit(:name, :email, :password, :password_confirmation)
    end
    
    def fonction_params
      params.require(:fonctions)
    end
end
