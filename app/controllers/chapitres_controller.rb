class ChapitresController < ApplicationController
  before_action :set_chapitre, only: [:show, :edit, :update, :destroy]

  respond_to :html
  
  layout :chapitres_layout
  
  @layout = "back"
  
  def chapitres_layout
    @layout
  end

  def index
    @layout = "back"
    @chapitres = Chapitre.all
    respond_with(@chapitres)
  end

  def show
    @layout = "back"
    respond_with(@chapitre)
  end

  def new
    @layout = "back"
    @chapitre = Chapitre.new
    respond_with(@chapitre)
  end

  def edit
    @layout = "back"
  end

  def create
    @layout = "back"
    @chapitre = Chapitre.new(chapitre_params)
    @chapitre.sections_id = section_params
    respond_to do |format|      
      if @chapitre.save
        if 
          format.html { redirect_to @chapitre, notice: 'Le chapitre a ete cree.' }
          format.json { render :show, status: :created, location: @produit }
        else
          format.html { render :new }
          format.json { render json: @chapitre.errors, status: :unprocessable_entity }
        end       
         
      end
    end
  end

  def update
    @layout = "back"
    @chapitre.update(chapitre_params)
    respond_with(@chapitre)
  end

  def destroy
    @layout = "back"
    @chapitre.destroy
    respond_with(@chapitre)
  end

  private
    def set_chapitre
      @chapitre = Chapitre.find(params[:id])
    end

    def chapitre_params
      params.require(:chapitre).permit(:ref, :nom, :description, :texte, :dateSuppression)
    end
    
     def section_params
      params.require(:section)
    end
end
