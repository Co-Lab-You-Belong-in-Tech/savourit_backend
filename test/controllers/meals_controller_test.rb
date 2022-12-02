require 'test_helper'

class MealsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal = meals(:one)
  end

  test 'should get index' do
    get meals_url
    assert_response :success
  end

  test 'should get new' do
    get new_meal_url
    assert_response :success
  end

  # rubocop:disable Layout/LineLength
  test 'should create meal' do
    assert_difference('Meal.count') do
      post meals_url,
           params: { meal: { description: @meal.description, name: @meal.name, photo: @meal.photo, price: @meal.price,
                             rating: @meal.rating, restaurant_id: @meal.restaurant_id, user_ratings_total: @meal.user_ratings_total } }
    end

    assert_redirected_to meal_url(Meal.last)
  end
  # rubocop:enable Layout/LineLength

  test 'should show meal' do
    get meal_url(@meal)
    assert_response :success
  end

  test 'should get edit' do
    get edit_meal_url(@meal)
    assert_response :success
  end

  # rubocop:disable Layout/LineLength

  test 'should update meal' do
    patch meal_url(@meal),
          params: { meal: { description: @meal.description, name: @meal.name, photo: @meal.photo, price: @meal.price,
                            rating: @meal.rating, restaurant_id: @meal.restaurant_id, user_ratings_total: @meal.user_ratings_total } }
    assert_redirected_to meal_url(@meal)
  end
  # rubocop:enable Layout/LineLength

  test 'should destroy meal' do
    assert_difference('Meal.count', -1) do
      delete meal_url(@meal)
    end

    assert_redirected_to meals_url
  end
end
