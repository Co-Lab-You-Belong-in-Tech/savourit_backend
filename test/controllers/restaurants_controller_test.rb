require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
  end

  test 'should get index' do
    get restaurants_url
    assert_response :success
  end

  test 'should get new' do
    get new_restaurant_url
    assert_response :success
  end

  # rubocop:disable Layout/LineLength
  test 'should create restaurant' do
    assert_difference('Restaurant.count') do
      post restaurants_url,
           params: { restaurant: { description: @restaurant.description, image: @restaurant.image,
                                   itinerary: @restaurant.itinerary, location: @restaurant.location, location_lat: @restaurant.location_lat, location_lng: @restaurant.location_lng, name: @restaurant.name, opening_hours: @restaurant.opening_hours, payment: @restaurant.payment, rating: @restaurant.rating, user_ratings_total: @restaurant.user_ratings_total } }
    end

    assert_redirected_to restaurant_url(Restaurant.last)
  end
  # rubocop:enable Layout/LineLength

  test 'should show restaurant' do
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test 'should get edit' do
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end

  # rubocop:disable Layout/LineLength
  test 'should update restaurant' do
    patch restaurant_url(@restaurant),
          params: { restaurant: { description: @restaurant.description, image: @restaurant.image,
                                  itinerary: @restaurant.itinerary, location: @restaurant.location, location_lat: @restaurant.location_lat, location_lng: @restaurant.location_lng, name: @restaurant.name, opening_hours: @restaurant.opening_hours, payment: @restaurant.payment, rating: @restaurant.rating, user_ratings_total: @restaurant.user_ratings_total } }
    assert_redirected_to restaurant_url(@restaurant)
  end
  # rubocop:enable Layout/LineLength

  test 'should destroy restaurant' do
    assert_difference('Restaurant.count', -1) do
      delete restaurant_url(@restaurant)
    end

    assert_redirected_to restaurants_url
  end
end
