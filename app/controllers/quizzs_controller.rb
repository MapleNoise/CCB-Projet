class QuizzsController < ApplicationController
  before_action :set_quizz, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @quizzs = Quizz.all
    respond_with(@quizzs)
  end

  def show
    respond_with(@quizz)
  end

  def new
    @quizz = Quizz.new
    respond_with(@quizz)
  end

  def edit
  end

  def create
    @quizz = Quizz.new(quizz_params)
    @quizz.chapitres_id = chapitre_params
    respond_to do |format|      
      if @quizz.save
        if 
          format.html { redirect_to @quizz, notice: 'Le quizz a ete cree.' }
          format.json { render :show, status: :created, location: @produit }
        else
          format.html { render :new }
          format.json { render json: @quizz.errors, status: :unprocessable_entity }
        end       
         
      end
    end
  end

  def update
    @quizz.update(quizz_params)
    respond_with(@quizz)
  end

  def destroy
    @quizz.destroy
    respond_with(@quizz)
  end

  private
    def set_quizz
      @quizz = Quizz.find(params[:id])
    end

    def quizz_params
      params.require(:quizz).permit(:ref, :nom, :description, :dateSuppression)
    end
    
     def chapitre_params
      params.require(:chapitre)
    end
end
