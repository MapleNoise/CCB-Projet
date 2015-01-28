class ProduitsController < ApplicationController
  before_action :set_produit, only: [:show, :edit, :update, :destroy, :delete]
  # GET /produits
  # GET /produits.json
  def index
    @produits = Produit.all
  end

  def test
    @produits = Produit.all
    
  #@produit = Produit.find_by(:id => 1)
  #@type_produit = TypeProduit.find_by(:id => @produit.type_produits_id)
  end

  # GET /produits/1
  # GET /produits/1.json
  def show
  end

  # GET /produits/new
  def new
    @produit = Produit.new
    @produit.init!
  end

  # GET /produits/1/edit
  def edit
  end

  # POST /produits
  # POST /produits.json
  def create
    @produit = Produit.new(produit_params)
    @produit.type_produits_id = type_produit_params
    #@produit_categorie  = Categories_produits.new
    #@produit_categorie.category_id = produit_categorie_params

    @tag = Tag.find_by(:id => produit_tag_params)
    @produit.tags << @tag

    respond_to do |format|
      Produit.transaction do
        if @produit.save
          if
          format.html { redirect_to @produit, notice: 'Le Produit a ete cree.' }
            format.json { render :show, status: :created, location: @produit }
          else
            format.html { render :new }
            format.json { render json: @produit.errors, status: :unprocessable_entity }
          end

        end
      end
    end
  end

  # PATCH/PUT /produits/1
  # PATCH/PUT /produits/1.json
  def update
    respond_to do |format|
      if @produit.update(produit_params)
        format.html { redirect_to @produit, notice: 'Produit was successfully updated.' }
        format.json { render :show, status: :ok, location: @produit }
      else
        format.html { render :edit }
        format.json { render json: @produit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produits/1
  # DELETE /produits/1.json
  def delete
    puts "Destruction en attente"

    @produit.delete!
    respond_to do |format|
      format.html { redirect_to produits_url, notice: 'Produit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_produit
    @produit = Produit.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def produit_params
    params.require(:produit).permit(:ref, :nom, :prix, :descriptionCourte, :description)
  end

  def produit_tag_params
    params.require(:tag)
  end

  def type_produit_params
    params.require(:types_produits)
  end
end
