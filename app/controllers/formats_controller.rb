class FormatsController < ApplicationController
  before_action :set_format, only: [:show, :edit, :update, :destroy]

  respond_to :html

  layout :formats_layout
  
  @layout = "back"
  
  def formats_layout
    @layout
  end
  
  
  def index
    @layout = "back"
    @formats = Format.all
    respond_with(@formats)
  end

  def show
    @layout = "back"
    respond_with(@format)
  end

  def new
    @layout = "back"
    @format = Format.new
    respond_with(@format)
  end

  def edit
    @layout = "back"
  end

  def create
    @layout = "back"
    @format = Format.new(format_params)
    @format.save
    respond_with(@format)
  end

  def update
    @layout = "back"
    @format.update(format_params)
    respond_with(@format)
  end

  def destroy
    @layout = "back"
    @format.destroy
    respond_with(@format)
  end

  private
    def set_format
      @format = Format.find(params[:id])
    end

    def format_params
      params.require(:format).permit(:extension)
    end
end
