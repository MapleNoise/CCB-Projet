class ReponsesController < ApplicationController
  before_action :set_reponse, only: [:show, :edit, :update, :destroy]
  before_action :test_client

  respond_to :html

  def index
    @reponses = Reponse.all
    respond_with(@reponses)
  end

  def show
    respond_with(@reponse)
  end

  def new
    @reponse = Reponse.new
    respond_with(@reponse)
  end

  def edit
  end

  def create
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
    @reponse.update(reponse_params)
    respond_with(@reponse)
  end

  def destroy
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
