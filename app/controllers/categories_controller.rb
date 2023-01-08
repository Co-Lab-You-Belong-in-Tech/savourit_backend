class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show; end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit; end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: t(:category_created) }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: t(:category_updated) }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: t(:category_destroyed) }
      format.json { head :no_content }
    end
  end

  def categories_manage
    @categories1 = Category.all.order(name: :asc)
    @categories2 = Category.all.order(name: :asc)
  end

  def categories_remove
    Category.all.each do |c|
      c.destroy if c.meals.length.zero?
    end
    redirect_to categories_url
  end

  def merge_categories
    Rails.logger.debug params[:category1]
    Rails.logger.debug params[:category2]

    category1 = Category.find(params[:category1])
    category2 = Category.find(params[:category2])

    category1.meals.each do |m|
      m.categories.push(category2)
    end
    category1.destroy

    redirect_to categories_manage_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :hunger_id)
  end
end
