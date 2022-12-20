require 'application_system_test_case'

class AvoidFoodCategoriesTest < ApplicationSystemTestCase
  setup do
    @avoid_food_category = avoid_food_categories(:one)
  end

  test 'visiting the index' do
    visit avoid_food_categories_url
    assert_selector 'h1', text: 'Avoid food categories'
  end

  test 'should create avoid food category' do
    visit avoid_food_categories_url
    click_on 'New avoid food category'

    fill_in 'Name', with: @avoid_food_category.name
    click_on 'Create Avoid food category'

    assert_text 'Avoid food category was successfully created'
    click_on 'Back'
  end

  test 'should update Avoid food category' do
    visit avoid_food_category_url(@avoid_food_category)
    click_on 'Edit this avoid food category', match: :first

    fill_in 'Name', with: @avoid_food_category.name
    click_on 'Update Avoid food category'

    assert_text 'Avoid food category was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Avoid food category' do
    visit avoid_food_category_url(@avoid_food_category)
    click_on 'Destroy this avoid food category', match: :first

    assert_text 'Avoid food category was successfully destroyed'
  end
end
