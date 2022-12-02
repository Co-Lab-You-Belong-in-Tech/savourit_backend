require 'application_system_test_case'

class RestaurantsTest < ApplicationSystemTestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test 'visiting the index' do
    visit restaurants_url
    assert_selector 'h1', text: 'Restaurants'
  end

  test 'should create restaurant' do
    visit restaurants_url
    click_on 'New restaurant'

    fill_in 'Description', with: @restaurant.description
    fill_in 'Image', with: @restaurant.image
    fill_in 'Itinerary', with: @restaurant.itinerary
    fill_in 'Location', with: @restaurant.location
    fill_in 'Location lat', with: @restaurant.location_lat
    fill_in 'Location lng', with: @restaurant.location_lng
    fill_in 'Name', with: @restaurant.name
    fill_in 'Opening hours', with: @restaurant.opening_hours
    fill_in 'Payment', with: @restaurant.payment
    fill_in 'Rating', with: @restaurant.rating
    fill_in 'User ratings total', with: @restaurant.user_ratings_total
    click_on 'Create Restaurant'

    assert_text 'Restaurant was successfully created'
    click_on 'Back'
  end

  test 'should update Restaurant' do
    visit restaurant_url(@restaurant)
    click_on 'Edit this restaurant', match: :first

    fill_in 'Description', with: @restaurant.description
    fill_in 'Image', with: @restaurant.image
    fill_in 'Itinerary', with: @restaurant.itinerary
    fill_in 'Location', with: @restaurant.location
    fill_in 'Location lat', with: @restaurant.location_lat
    fill_in 'Location lng', with: @restaurant.location_lng
    fill_in 'Name', with: @restaurant.name
    fill_in 'Opening hours', with: @restaurant.opening_hours
    fill_in 'Payment', with: @restaurant.payment
    fill_in 'Rating', with: @restaurant.rating
    fill_in 'User ratings total', with: @restaurant.user_ratings_total
    click_on 'Update Restaurant'

    assert_text 'Restaurant was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Restaurant' do
    visit restaurant_url(@restaurant)
    click_on 'Destroy this restaurant', match: :first

    assert_text 'Restaurant was successfully destroyed'
  end
end
