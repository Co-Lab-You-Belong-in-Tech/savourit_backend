class AllergensController < ApplicationController
  before_action :set_allergen, only: %i[show edit update destroy]

  # GET /allergens or /allergens.json
  def index
    @allergens = Allergen.all
  end

  # GET /allergens/1 or /allergens/1.json
  def show; end

  # GET /allergens/new
  def new
    @allergen = Allergen.new
  end

  # GET /allergens/1/edit
  def edit; end

  # POST /allergens or /allergens.json
  def create
    @allergen = Allergen.new(allergen_params)

    respond_to do |format|
      if @allergen.save
        format.html { redirect_to allergen_url(@allergen), notice: t(:allergen_created) }
        format.json { render :show, status: :created, location: @allergen }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @allergen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allergens/1 or /allergens/1.json
  def update
    respond_to do |format|
      if @allergen.update(allergen_params)
        format.html { redirect_to allergen_url(@allergen), notice: t(:allergen_updated) }
        format.json { render :show, status: :ok, location: @allergen }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @allergen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allergens/1 or /allergens/1.json
  def destroy
    @allergen.destroy

    respond_to do |format|
      format.html { redirect_to allergens_url, notice: t(:allergen_destroyed) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_allergen
    @allergen = Allergen.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def allergen_params
    params.require(:allergen).permit(:name)
  end
end
