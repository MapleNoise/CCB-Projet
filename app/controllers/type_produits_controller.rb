class TypeProduitsController < ApplicationController
  before_action :set_type_produit, only: [:show, :edit, :update, :destroy]
  before_action :acces_juste_admin

  # GET /type_produits
  # GET /type_produits.json
  def index
    @type_produits = TypeProduit.all
  end

  # GET /type_produits/1
  # GET /type_produits/1.json
  def show
  end

  # GET /type_produits/new
  def new
    @type_produit = TypeProduit.new
  end

  # GET /type_produits/1/edit
  def edit
  end

  # POST /type_produits
  # POST /type_produits.json
  def create
    @type_produit = TypeProduit.new(type_produit_params)

    puts "------extension_fichier_params------"
    puts extension_fichier_params
        
    respond_to do |format|
      if @type_produit.save
        format.html { redirect_to @type_produit, notice: 'Type produit was successfully created.' }
        format.json { render :show, status: :created, location: @type_produit }
      else
        format.html { render :new }
        format.json { render json: @type_produit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_produits/1
  # PATCH/PUT /type_produits/1.json
  def update
    respond_to do |format|
      if @type_produit.update(type_produit_params)
        format.html { redirect_to @type_produit, notice: 'Type produit was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_produit }
      else
        format.html { render :edit }
        format.json { render json: @type_produit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_produits/1
  # DELETE /type_produits/1.json
  def destroy
    @type_produit.destroy
    respond_to do |format|
      format.html { redirect_to type_produits_url, notice: 'Type produit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_produit
      @type_produit = TypeProduit.find(params[:id])
    end

    def extension_fichier_params
      @type_produit.extension_fichier_ids
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_produit_params
      params.require(:type_produit).permit(:nom, :extension_fichier_ids => [])
    end
end
