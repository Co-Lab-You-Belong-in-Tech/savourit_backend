require 'open-uri'
require 'net/http'
require 'nokogiri'
require 'delivery/uber_delivery'

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
    response = UberDelivery.scrap(params[:restaurant][:url])
    @restaurant = response[:restaurant]
    @errors = response[:errors]

    respond_to do |format|
      if response[:code] == UberDelivery::SUCCESS
        format.html { redirect_to restaurant_url(response[:restaurant]), notice: t(:restaurant_created) }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: response[:errors], status: :unprocessable_entity }
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
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    html = response.body
    @doc = Nokogiri::HTML(html)
    nom = @doc.xpath('/html/body/div[1]/div[1]/div/main/div[3]/div/div[1]/h1').text

    p = params.require(:restaurant).permit
    p[:name] = nom
    p[:address] = 'tmp'
    p[:street_address] = 'tmp'
    p[:city] = 'tmp'
    p[:country] = 'tmp'
    p
  end

  def create_meal(restaurant)
    t = @doc.xpath('/html/body/div[1]/div[1]/div/main/div[4]/div[1]/div[4]/ul/li/ul/li')
    t.each do |f|
      a = f.css('span')
      t1 = a.children[0].text unless a.children[0].nil?
      t2 = a.children[1].text unless a.children[1].nil?
      t3 = a.children[2].text unless a.children[2].nil?

      meal = Meal.new(title: t1, price: t2, description: t3, restaurant:)
      meal.save
    end
  end
end
