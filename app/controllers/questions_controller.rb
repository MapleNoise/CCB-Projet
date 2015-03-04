class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  respond_to :html

  layout :questions_layout
  
  @layout = "back"
  
  def questions_layout
    @layout
  end
  
  
  def index
    @layout = "back"
    @questions = Question.all
    respond_with(@questions)
  end

  def show
    @layout = "back"
    respond_with(@question)
  end

  def new
    @layout = "back"
    @question = Question.new
    respond_with(@question)
  end

  def edit
    @layout = "back"
  end

  def create
    @layout = "back"
    @question = Question.new(question_params)
    @question.quizzs_id = quizz_params
    respond_to do |format|      
      if @question.save
        if 
          format.html { redirect_to @question, notice: 'Le question a ete cree.' }
          format.json { render :show, status: :created, location: @produit }
        else
          format.html { render :new }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end       
        
      end
    end
  end

  def update
    @layout = "back"
    @question.update(question_params)
    respond_with(@question)
  end

  def destroy
    @layout = "back"
    @question.destroy
    respond_with(@question)
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:nom, :dateSuppression)
  end
    
  def quizz_params
    params.require(:quizz)
  end
end
