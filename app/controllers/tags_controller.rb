class TagsController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :test_client

  # GET /Tags
  # GET /Tags.json
  def index
    @tags = Tag.all
  end

  # GET /Tags/1
  # GET /Tags/1.json
  def show
  end

  # GET /Tags/new
  def new
    @tag = Tag.new
  end

  # GET /Tags/1/edit
  def edit
  end

  # POST /Tags
  # POST /Tags.json
  def create
    @tag = Tag.new(category_params)
    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Tags/1
  # PATCH/PUT /Tags/1.json
  def update
    respond_to do |format|
      if @tag.update(category_params)
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Tags/1
  # DELETE /Tags/1.json
  def destroy
    @tag.delete!
    respond_to do |format|
      format.html { redirect_to tags_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:tag).permit(:nom, :mere)
    end
end
