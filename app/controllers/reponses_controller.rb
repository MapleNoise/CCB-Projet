class ReponsesController < ApplicationController
  before_action :set_reponse, only: [:show, :edit, :update, :destroy]

  respond_to :html

  layout :reponses_layout
  
  @layout = "back"
  
  def reponses_layout
    @layout
  end
  
  
  def index
    @layout = "back"
    @reponses = Reponse.all
    respond_with(@reponses)
  end

  def show
    @layout = "back"
    respond_with(@reponse)
  end

  def new
    @layout = "back"
    @reponse = Reponse.new
    respond_with(@reponse)
  end

  def edit
    @layout = "back"
  end

  def create
    @layout = "back"
    @reponse = Reponse.new(reponse_params)
   @reponse.questions_id = question_params
    respond_to do |format|      
      if @reponse.save
        if 
          format.html { redirect_to @reponse, notice: 'Le reponse a ete cree.' }
          format.json { render :show, status: :created, location: @produit }
        else
          format.html { render :new }
          format.json { render json: @reponse.errors, status: :unprocessable_entity }
        end       
         
      end
    end
  end

  def update
    @layout = "back"
    @reponse.update(reponse_params)
    respond_with(@reponse)
  end

  def destroy
    @layout = "back"
    @reponse.destroy
    respond_with(@reponse)
  end

  private
    def set_reponse
      @reponse = Reponse.find(params[:id])
    end

    def reponse_params
      params.require(:reponse).permit(:reponse, :estJuste, :dateSuppression)
    end
    def question_params
      params.require(:question)
    end
    
end
