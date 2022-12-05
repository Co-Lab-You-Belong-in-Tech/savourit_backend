class HungersController < ApplicationController
  before_action :set_hunger, only: %i[show edit update destroy]

  # GET /hungers or /hungers.json
  def index
    @hungers = Hunger.all
  end

  # GET /hungers/1 or /hungers/1.json
  def show; end

  # GET /hungers/new
  def new
    @hunger = Hunger.new
  end

  # GET /hungers/1/edit
  def edit; end

  # POST /hungers or /hungers.json
  def create
    @hunger = Hunger.new(hunger_params)

    respond_to do |format|
      if @hunger.save
        format.html { redirect_to hunger_url(@hunger), notice: t(:hunger_created) }
        format.json { render :show, status: :created, location: @hunger }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hunger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hungers/1 or /hungers/1.json
  def update
    respond_to do |format|
      if @hunger.update(hunger_params)
        format.html { redirect_to hunger_url(@hunger), notice: t(:hunger_updated) }
        format.json { render :show, status: :ok, location: @hunger }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hunger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hungers/1 or /hungers/1.json
  def destroy
    @hunger.destroy

    respond_to do |format|
      format.html { redirect_to hungers_url, notice: t(:hunger_destroyed) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hunger
    @hunger = Hunger.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def hunger_params
    params.require(:hunger).permit(:value)
  end
end
