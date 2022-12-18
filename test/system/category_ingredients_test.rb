require 'application_system_test_case'

class CategoryIngredientsTest < ApplicationSystemTestCase
  setup do
    @category_ingredient = category_ingredients(:one)
  end

  test 'visiting the index' do
    visit category_ingredients_url
    assert_selector 'h1', text: 'Category ingredients'
  end

  test 'should create category ingredient' do
    visit category_ingredients_url
    click_on 'New category ingredient'

    click_on 'Create Category ingredient'

    assert_text 'Category ingredient was successfully created'
    click_on 'Back'
  end

  test 'should update Category ingredient' do
    visit category_ingredient_url(@category_ingredient)
    click_on 'Edit this category ingredient', match: :first

    click_on 'Update Category ingredient'

    assert_text 'Category ingredient was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Category ingredient' do
    visit category_ingredient_url(@category_ingredient)
    click_on 'Destroy this category ingredient', match: :first

    assert_text 'Category ingredient was successfully destroyed'
  end
end
