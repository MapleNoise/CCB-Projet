class FormatsController < ApplicationController
  before_action :set_format, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @formats = Format.all
    respond_with(@formats)
  end

  def show
    respond_with(@format)
  end

  def new
    @format = Format.new
    respond_with(@format)
  end

  def edit
  end

  def create
    @format = Format.new(format_params)
    @format.save
    respond_with(@format)
  end

  def update
    @format.update(format_params)
    respond_with(@format)
  end

  def destroy
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
