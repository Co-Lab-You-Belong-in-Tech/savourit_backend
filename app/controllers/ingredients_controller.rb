class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[show edit update destroy]

  # GET /ingredients or /ingredients.json
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1 or /ingredients/1.json
  def show; end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit; end

  # POST /ingredients or /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to ingredient_url(@ingredient), notice: t(:ingredient_created) }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1 or /ingredients/1.json
  def update
    respond_to do |format|
      categorie = @ingredient.category_ingredient

      if @ingredient.update(ingredient_params)

        @ingredient.meals.each do |m|
          m.category_ingredients.delete(categorie) unless categorie.nil?
          m.category_ingredients.push(@ingredient.category_ingredient)
        end

        format.html { redirect_to ingredient_url(@ingredient), notice: t(:ingredient_updated) }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1 or /ingredients/1.json
  def destroy
    @ingredient.destroy

    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: t(:ingredient_destroyed) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ingredient_params
    # params.fetch(:ingredient, {name})
    params.require(:ingredient).permit(:name, :category_ingredient_id, :allergen_id)
  end
end
