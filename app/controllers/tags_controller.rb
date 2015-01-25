class TagsController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /Tags
  # GET /Tags.json
  def index
    @Tags = Tag.all
  end

  # GET /Tags/1
  # GET /Tags/1.json
  def show
  end

  # GET /Tags/new
  def new
    @Tag = Tag.new
  end

  # GET /Tags/1/edit
  def edit
  end

  # POST /Tags
  # POST /Tags.json
  def create
    @Tag = Tag.new(category_params)
    respond_to do |format|
      if @Tag.save
        format.html { redirect_to @Tag, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @Tag }
      else
        format.html { render :new }
        format.json { render json: @Tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Tags/1
  # PATCH/PUT /Tags/1.json
  def update
    respond_to do |format|
      if @Tag.update(category_params)
        format.html { redirect_to @Tag, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @Tag }
      else
        format.html { render :edit }
        format.json { render json: @Tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Tags/1
  # DELETE /Tags/1.json
  def destroy
    @Tag.delete!
    respond_to do |format|
      format.html { redirect_to Tags_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @Tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:Tag).permit(:nom, :mere)
    end
end
