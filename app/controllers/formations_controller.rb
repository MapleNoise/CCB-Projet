class FormationsController < ApplicationController
  before_action :set_formation, only: [:show, :edit, :update, :destroy]
  before_action :test_client, only: [:new, :show, :edit, :update, :destroy]

  layout :formations_layout

  @layout = "back"

  def formations_layout
    @layout
  end

  respond_to :html

  def index
    @layout = "back"
    @formations = Formation.all
    respond_with(@formations)
  end

  def show
    @layout = "application"
    respond_with(@formation)
  end

  def new
    @layout = "back"
    @formation = Formation.new
    @formation.init!
  end

  def edit
    @layout = "back"
  end

  def create
    @layout = "back"
    @formation = Formation.new(formation_params)
    @formation.estPublic = false
    @formation.save
    respond_with(@formation)
  end

  def update
    @layout = "back"
    @formation.update(formation_params)
    respond_with(@formation)
  end

  def destroy
    @layout = "back"
    @formation.destroy
    respond_with(@formation)
  end

  private
    def set_formation
      @formation = Formation.find(params[:id])
    end

    def formation_params
      params.require(:formation).permit(:ref, :nom, :descriptionCourte, :description, :dateSuppression, :prix, :statusId)
    end

end
