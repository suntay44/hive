class HiveCategoriesController < ApplicationController
  before_action :set_hive_category, only: [:show, :edit, :update, :destroy]

  # GET /hive_categories
  # GET /hive_categories.json
  def index
    @hive_categories = HiveInformation.all
  end

  # GET /hive_categories/1
  # GET /hive_categories/1.json
  def show
  end

  # GET /hive_categories/new
  def new
     @hive_categories = HiveCategory.all
    @hive_category = HiveCategory.new
  end

  # GET /hive_categories/1/edit
  def edit
  end

  # POST /hive_categories
  # POST /hive_categories.json
  def create
    @hive_category = HiveCategory.new(hive_category_params)

    respond_to do |format|
      if @hive_category.save
        format.html { redirect_to @hive_category, notice: 'Hive category was successfully created.' }
        format.json { render :show, status: :created, location: @hive_category }
      else
        format.html { render :new }
        format.json { render json: @hive_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hive_categories/1
  # PATCH/PUT /hive_categories/1.json
  def update
    respond_to do |format|
      if @hive_category.update(hive_category_params)
        format.html { redirect_to @hive_category, notice: 'Hive category was successfully updated.' }
        format.json { render :show, status: :ok, location: @hive_category }
      else
        format.html { render :edit }
        format.json { render json: @hive_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hive_categories/1
  # DELETE /hive_categories/1.json
  def destroy
    @hive_category.destroy
    respond_to do |format|
      format.html { redirect_to hive_categories_url, notice: 'Hive category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hive_category
      @hive_category = HiveCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hive_category_params
      params.require(:hive_category).permit(:cat_id, :name, :description, :is_active)
    end
end
