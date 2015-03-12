class QuizzsController < ApplicationController
  before_action :set_quizz, only: [:show, :edit, :update, :destroy]
  before_action :test_client, only: [:new, :create, :edit, :update, :destroy]


  respond_to :html
  
  layout :quizzs_layout
  
  @layout = "back"
  
  def quizzs_layout
    @layout
  end

  def index
    @layout = "back"
    @quizzs = Quizz.all
    respond_with(@quizzs)
  end

  def show
    @layout = "application"
    respond_with(@quizz)
  end

  def new
    @layout = "back"
    @quizz = Quizz.new
    respond_with(@quizz)
  end

  def edit
    @layout = "back"
  end

  def create
    @layout = "back"
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
    @layout = "back"
    @quizz.update(quizz_params)
    respond_with(@quizz)
  end

  def destroy
    @layout = "back"
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
