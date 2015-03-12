# coding: utf-8
class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  before_action :test_client, only: [:new, :index, :create, :edit, :update, :destroy]
  before_action :set_formation

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
    respond_with(@formation, @section)
  end

  def edit
    @layout = "back"
  end

  def create
    @layout = "back"
    @section = Section.new(section_params)
    @section.formations_id = formation_params

    if @section.save
      redirect_to formation_section_path(@formation, @section), notice: 'La section a été crée.'
    else
      flash[:error] = @section.errors.full_messages
      render :new
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

  def set_formation
    @formation = Formation.find_by(:id => formation_params)
  end

  def set_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:titre, :description, :dateSuppression)
  end

  def formation_params
    params.require(:formation_id)
  end
end
