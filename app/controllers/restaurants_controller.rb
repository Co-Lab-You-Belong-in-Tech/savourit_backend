require 'open-uri'
require 'net/http'
require 'nokogiri'

class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  # GET /restaurants or /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1 or /restaurants/1.json
  def show; end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit; end

  # POST /restaurants or /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to restaurant_url(@restaurant), notice: t(:restaurant_created) }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1 or /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to restaurant_url(@restaurant), notice: t(:restaurant_updated) }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1 or /restaurants/1.json
  def destroy
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: t(:restaurant_destroyed) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def restaurant_params
    url = params[:restaurant][:url]
    # url = 'https://www.ubereats.com/fr-en/store/sultan-kebab/YNTeyyRSSJqf902xebiPwA?diningMode=DELIVERY'
    uri = URI.parse(url)

    response = Net::HTTP.get_response(uri)
    html = response.body

    doc = Nokogiri::HTML(html)
    nom = doc.xpath('/html/body/div[1]/div[1]/div/main/div[3]/div/div[1]/h1').text
    # description = doc.xpath('/html/body/div[1]/div[1]/div/main/div[3]/div/div[1]/div[2]/div/div[1]/a[1]/div')
    payment = doc.xpath('/html/body/div[1]/div[1]/div/main/div[3]/div/div[1]/div[2]/div/a/span/span').text
    location = doc.xpath('/html/body/div[1]/div[1]/div/main/div[3]/div/div[1]/div[2]/div/div[3]/span').text
    # user_ratings_total
    # opening_hours
    # rating
    # itinerary
    image = doc.xpath('/html/body/div[1]/div[1]/div/main/div[2]/div/figure/div[1]/img').attribute('src')

    p = params.require(:restaurant).permit
    p[:name] = nom
    p[:payment] = payment
    p[:location] = location
    p[:image] = image
    p
  end
end
