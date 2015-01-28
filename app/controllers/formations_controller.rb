class FormationsController < ApplicationController
  before_action :set_formation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @formations = Formation.all
    respond_with(@formations)
  end

  def show
    respond_with(@formation)
  end

  def new
    @formation = Formation.new
    respond_with(@formation)
  end

  def edit
  end

  def create
    @formation = Formation.new(formation_params)
    @formation.save
    respond_with(@formation)
  end

  def update
    @formation.update(formation_params)
    respond_with(@formation)
  end

  def destroy
    @formation.destroy
    respond_with(@formation)
  end

  private
    def set_formation
      @formation = Formation.find(params[:id])
    end

    def formation_params
      params.require(:formation).permit(:ref, :nom, :descriptionCourte, :description, :estPublic, :dateSuppression)
    end
end
