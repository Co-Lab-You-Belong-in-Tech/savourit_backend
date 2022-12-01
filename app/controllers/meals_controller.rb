class MealsController < ApplicationController
  before_action :set_meal, only: %i[show edit update destroy]

  # GET /meals or /meals.json
  def index
    @meals = Meal.where(restaurant: params[:restaurant_id])
    @restaurant = Restaurant.find(params[:restaurant_id])

    # @foods = Food.where(user: current_user)
  end

  # GET /meals/1 or /meals/1.json
  def show; end

  # GET /meals/new
  def new
    @meal = Meal.new
    @restaurants = Restaurant.all
    @options = Restaurant.all.collect do |s|
      [s.name, s.id]
    end
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # GET /meals/1/edit
  def edit; end

  # POST /meals or /meals.json
  def create
    @meal = Meal.new(meal_params)

    respond_to do |format|
      if @meal.save
        format.html { redirect_to restaurants_path, notice: t(:meal_created) }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1 or /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to meal_url(@meal), notice: t(:meal_updated) }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1 or /meals/1.json
  def destroy
    @meal.destroy

    respond_to do |format|
      format.html { redirect_to restaurant_meals_path, notice: t(:meal_destroyed) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meal
    @meal = Meal.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def meal_params
    params.require(:meal).permit(:name, :price, :description, :photo, :rating, :user_ratings_total, :restaurant_id)
  end
end
