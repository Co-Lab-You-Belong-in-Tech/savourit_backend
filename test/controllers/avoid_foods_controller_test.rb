require 'test_helper'

class AvoidFoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avoid_food = avoid_foods(:one)
  end

  test 'should get index' do
    get avoid_foods_url
    assert_response :success
  end

  test 'should get new' do
    get new_avoid_food_url
    assert_response :success
  end

  test 'should create avoid_food' do
    assert_difference('AvoidFood.count') do
      post avoid_foods_url,
           params: { avoid_food: { avoid_food_category_id: @avoid_food.avoid_food_category_id,
                                   name: @avoid_food.name } }
    end

    assert_redirected_to avoid_food_url(AvoidFood.last)
  end

  test 'should show avoid_food' do
    get avoid_food_url(@avoid_food)
    assert_response :success
  end

  test 'should get edit' do
    get edit_avoid_food_url(@avoid_food)
    assert_response :success
  end

  test 'should update avoid_food' do
    patch avoid_food_url(@avoid_food),
          params: { avoid_food: { avoid_food_category_id: @avoid_food.avoid_food_category_id, name: @avoid_food.name } }
    assert_redirected_to avoid_food_url(@avoid_food)
  end

  test 'should destroy avoid_food' do
    assert_difference('AvoidFood.count', -1) do
      delete avoid_food_url(@avoid_food)
    end

    assert_redirected_to avoid_foods_url
  end
end
