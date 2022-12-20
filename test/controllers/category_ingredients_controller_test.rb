require 'test_helper'

class CategoryIngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_ingredient = category_ingredients(:one)
  end

  test 'should get index' do
    get category_ingredients_url
    assert_response :success
  end

  test 'should get new' do
    get new_category_ingredient_url
    assert_response :success
  end

  test 'should create category_ingredient' do
    assert_difference('CategoryIngredient.count') do
      post category_ingredients_url, params: { category_ingredient: {} }
    end

    assert_redirected_to category_ingredient_url(CategoryIngredient.last)
  end

  test 'should show category_ingredient' do
    get category_ingredient_url(@category_ingredient)
    assert_response :success
  end

  test 'should get edit' do
    get edit_category_ingredient_url(@category_ingredient)
    assert_response :success
  end

  test 'should update category_ingredient' do
    patch category_ingredient_url(@category_ingredient), params: { category_ingredient: {} }
    assert_redirected_to category_ingredient_url(@category_ingredient)
  end

  test 'should destroy category_ingredient' do
    assert_difference('CategoryIngredient.count', -1) do
      delete category_ingredient_url(@category_ingredient)
    end

    assert_redirected_to category_ingredients_url
  end
end
