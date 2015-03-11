class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  before_action :test_client, only: [:new, :index, :create, :edit, :update, :destroy]

  respond_to :html
  
    layout :sections_layout
  
  @layout = "back"
  
  def sections_layout
    @layout
  end
  
  
  def index
    @layout = "back"
    @sections = Section.all
    respond_with(@sections)
  end

  def show
    @layout = "application"
    respond_with(@section)
  end

  def new
    @layout = "back"
    @section = Section.new
    respond_with(@section)
  end

  def edit
    @layout = "back"
  end

  def create
    @layout = "back"
    @section = Section.new(section_params)
    @section.formations_id = formation_params
    respond_to do |format|      
      if @section.save
        if 
          format.html { redirect_to @section, notice: 'La section a ete cree.' }
          format.json { render :show, status: :created, location: @produit }
        else
          format.html { render :new }
          format.json { render json: @section.errors, status: :unprocessable_entity }
        end       
         
      end
    end
  end

  def update
    @layout = "back"
    @section.update(section_params)
    respond_with(@section)
  end

  def destroy
    @layout = "back"
    @section.destroy
    respond_with(@section)
  end

  private
  def set_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:ref, :nom, :description, :dateSuppression)
  end
    
  def formation_params
    params.require(:formation)
  end
end
