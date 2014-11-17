class FicheProduitsController < ApplicationController
  before_action :set_fiche_produit, only: [:show, :edit, :update, :destroy]

  # GET /fiche_produits
  # GET /fiche_produits.json
  def index
    @fiche_produits = FicheProduit.all
  end

  # GET /fiche_produits/1
  # GET /fiche_produits/1.json
  def show
  end

  # GET /fiche_produits/new
  def new
    @fiche_produit = FicheProduit.new
  end

  # GET /fiche_produits/1/edit
  def edit
  end

  # POST /fiche_produits
  # POST /fiche_produits.json
  def create
    @fiche_produit = FicheProduit.new(fiche_produit_params)
    
    
    respond_to do |format|
      if @fiche_produit.save
        format.html { redirect_to @fiche_produit, notice: 'Fiche produit was successfully created.' }
        format.json { render :show, status: :created, location: @fiche_produit }
      else
        format.html { render :new }
        format.json { render json: @fiche_produit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fiche_produits/1
  # PATCH/PUT /fiche_produits/1.json
  def update
    respond_to do |format|
      if @fiche_produit.update(fiche_produit_params)
        format.html { redirect_to @fiche_produit, notice: 'Fiche produit was successfully updated.' }
        format.json { render :show, status: :ok, location: @fiche_produit }
      else
        format.html { render :edit }
        format.json { render json: @fiche_produit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fiche_produits/1
  # DELETE /fiche_produits/1.json
  def destroy
    @fiche_produit.delete!
    respond_to do |format|
      format.html { redirect_to fiche_produits_url, notice: 'Fiche produit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fiche_produit
      @fiche_produit = FicheProduit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fiche_produit_params
      params.require(:fiche_produit).permit(:ref, :titre, :description, :descriptionCourte, :datePublication, :dateCreation, :dateModification, :dateSuppression)
    end
end
