class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :edit, :update, :destroy]
  before_action :acces_juste_admin

  respond_to :html

   layout :statuses_layout
  
  @layout = "back"
  
  def statuses_layout
    @layout
  end
  
  
  def index
    @layout = "back"
    @statuses = Status.all
    respond_with(@statuses)
  end

  def show
    @layout = "back"
    respond_with(@status)
  end

  def new
    @layout = "back"
    @status = Status.new
    respond_with(@status)
  end

  def edit
    @layout = "back"
  end

  def create
    @layout = "back"
    @status = Status.new(status_params)
    @status.save
    respond_with(@status)
  end

  def update
    @layout = "back"
    @status.update(status_params)
    respond_with(@status)
  end

  def destroy
    @layout = "back"
    @status.destroy
    respond_with(@status)
  end

  private
    def set_status
      @status = Status.find(params[:id])
    end

    def status_params
      params.require(:status).permit(:nom)
    end
end
