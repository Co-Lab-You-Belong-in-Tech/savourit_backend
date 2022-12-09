require 'test_helper'

class AvoidFoodCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avoid_food_category = avoid_food_categories(:one)
  end

  test 'should get index' do
    get avoid_food_categories_url
    assert_response :success
  end

  test 'should get new' do
    get new_avoid_food_category_url
    assert_response :success
  end

  test 'should create avoid_food_category' do
    assert_difference('AvoidFoodCategory.count') do
      post avoid_food_categories_url, params: { avoid_food_category: { name: @avoid_food_category.name } }
    end

    assert_redirected_to avoid_food_category_url(AvoidFoodCategory.last)
  end

  test 'should show avoid_food_category' do
    get avoid_food_category_url(@avoid_food_category)
    assert_response :success
  end

  test 'should get edit' do
    get edit_avoid_food_category_url(@avoid_food_category)
    assert_response :success
  end

  test 'should update avoid_food_category' do
    patch avoid_food_category_url(@avoid_food_category),
          params: { avoid_food_category: { name: @avoid_food_category.name } }
    assert_redirected_to avoid_food_category_url(@avoid_food_category)
  end

  test 'should destroy avoid_food_category' do
    assert_difference('AvoidFoodCategory.count', -1) do
      delete avoid_food_category_url(@avoid_food_category)
    end

    assert_redirected_to avoid_food_categories_url
  end
end
