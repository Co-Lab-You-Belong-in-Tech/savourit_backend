class AvoidFoodsController < ApplicationController
  before_action :set_avoid_food, only: %i[show edit update destroy]

  # GET /avoid_foods or /avoid_foods.json
  def index
    @avoid_foods = AvoidFood.all
  end

  # GET /avoid_foods/1 or /avoid_foods/1.json
  def show; end

  # GET /avoid_foods/new
  def new
    @avoid_food = AvoidFood.new
  end

  # GET /avoid_foods/1/edit
  def edit; end

  # POST /avoid_foods or /avoid_foods.json
  def create
    @avoid_food = AvoidFood.new(avoid_food_params)

    respond_to do |format|
      if @avoid_food.save
        format.html { redirect_to avoid_food_url(@avoid_food), notice: t(:avoid_food_created) }
        format.json { render :show, status: :created, location: @avoid_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @avoid_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avoid_foods/1 or /avoid_foods/1.json
  def update
    respond_to do |format|
      if @avoid_food.update(avoid_food_params)
        format.html { redirect_to avoid_food_url(@avoid_food), notice: t(:avoid_food_updated) }
        format.json { render :show, status: :ok, location: @avoid_food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @avoid_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avoid_foods/1 or /avoid_foods/1.json
  def destroy
    @avoid_food.destroy

    respond_to do |format|
      format.html { redirect_to avoid_foods_url, notice: t(:avoid_food_destroyed) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_avoid_food
    @avoid_food = AvoidFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def avoid_food_params
    params.require(:avoid_food).permit(:name, :avoid_food_category_id)
  end
end
