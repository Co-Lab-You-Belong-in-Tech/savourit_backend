class CategoryIngredientsController < ApplicationController
  before_action :set_category_ingredient, only: %i[show edit update destroy]

  # GET /category_ingredients or /category_ingredients.json
  def index
    @category_ingredients = CategoryIngredient.all
  end

  # GET /category_ingredients/1 or /category_ingredients/1.json
  def show; end

  # GET /category_ingredients/new
  def new
    @category_ingredient = CategoryIngredient.new
  end

  # GET /category_ingredients/1/edit
  def edit; end

  # POST /category_ingredients or /category_ingredients.json
  def create
    @category_ingredient = CategoryIngredient.new(category_ingredient_params)

    respond_to do |format|
      if @category_ingredient.save
        format.html do
          redirect_to category_ingredient_url(@category_ingredient), notice: t(:category_ingredient_created)
        end
        format.json { render :show, status: :created, location: @category_ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_ingredients/1 or /category_ingredients/1.json
  def update
    respond_to do |format|
      if @category_ingredient.update(category_ingredient_params)
        format.html do
          redirect_to category_ingredient_url(@category_ingredient),
                      notice: t(:category_ingredient_updated)
        end
        format.json { render :show, status: :ok, location: @category_ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_ingredients/1 or /category_ingredients/1.json
  def destroy
    @category_ingredient.destroy

    respond_to do |format|
      format.html { redirect_to category_ingredients_url, notice: t(:category_ingredient_destroyed) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category_ingredient
    @category_ingredient = CategoryIngredient.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_ingredient_params
    # params.fetch(:category_ingredient, {})
    params.require(:category_ingredient).permit(:name)
  end
end
