class AvoidFoodCategoriesController < ApplicationController
  before_action :set_avoid_food_category, only: %i[show edit update destroy]

  # GET /avoid_food_categories or /avoid_food_categories.json
  def index
    @avoid_food_categories = AvoidFoodCategory.all
  end

  # GET /avoid_food_categories/1 or /avoid_food_categories/1.json
  def show; end

  # GET /avoid_food_categories/new
  def new
    @avoid_food_category = AvoidFoodCategory.new
  end

  # GET /avoid_food_categories/1/edit
  def edit; end

  # POST /avoid_food_categories or /avoid_food_categories.json
  def create
    @avoid_food_category = AvoidFoodCategory.new(avoid_food_category_params)

    respond_to do |format|
      if @avoid_food_category.save
        format.html do
          redirect_to avoid_food_category_url(@avoid_food_category),
                      notice: t(:avoid_food_category_created)
        end
        format.json { render :show, status: :created, location: @avoid_food_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @avoid_food_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avoid_food_categories/1 or /avoid_food_categories/1.json
  def update
    respond_to do |format|
      if @avoid_food_category.update(avoid_food_category_params)
        format.html do
          redirect_to avoid_food_category_url(@avoid_food_category),
                      notice: t(:avoid_food_category_updated)
        end
        format.json { render :show, status: :ok, location: @avoid_food_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @avoid_food_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avoid_food_categories/1 or /avoid_food_categories/1.json
  def destroy
    @avoid_food_category.destroy

    respond_to do |format|
      format.html do
        redirect_to avoid_food_categories_url,
                    notice: t(:avoid_food_category_destroyed)
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_avoid_food_category
    @avoid_food_category = AvoidFoodCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def avoid_food_category_params
    params.require(:avoid_food_category).permit(:name)
  end
end
