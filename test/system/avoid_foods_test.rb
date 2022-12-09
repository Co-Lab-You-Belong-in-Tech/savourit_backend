require 'application_system_test_case'

class AvoidFoodsTest < ApplicationSystemTestCase
  setup do
    @avoid_food = avoid_foods(:one)
  end

  test 'visiting the index' do
    visit avoid_foods_url
    assert_selector 'h1', text: 'Avoid foods'
  end

  test 'should create avoid food' do
    visit avoid_foods_url
    click_on 'New avoid food'

    fill_in 'Avoid food category', with: @avoid_food.avoid_food_category_id
    fill_in 'Name', with: @avoid_food.name
    click_on 'Create Avoid food'

    assert_text 'Avoid food was successfully created'
    click_on 'Back'
  end

  test 'should update Avoid food' do
    visit avoid_food_url(@avoid_food)
    click_on 'Edit this avoid food', match: :first

    fill_in 'Avoid food category', with: @avoid_food.avoid_food_category_id
    fill_in 'Name', with: @avoid_food.name
    click_on 'Update Avoid food'

    assert_text 'Avoid food was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Avoid food' do
    visit avoid_food_url(@avoid_food)
    click_on 'Destroy this avoid food', match: :first

    assert_text 'Avoid food was successfully destroyed'
  end
end
