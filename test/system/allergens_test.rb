require 'application_system_test_case'

class AllergensTest < ApplicationSystemTestCase
  setup do
    @allergen = allergens(:one)
  end

  test 'visiting the index' do
    visit allergens_url
    assert_selector 'h1', text: 'Allergens'
  end

  test 'should create allergen' do
    visit allergens_url
    click_on 'New allergen'

    fill_in 'Name', with: @allergen.name
    click_on 'Create Allergen'

    assert_text 'Allergen was successfully created'
    click_on 'Back'
  end

  test 'should update Allergen' do
    visit allergen_url(@allergen)
    click_on 'Edit this allergen', match: :first

    fill_in 'Name', with: @allergen.name
    click_on 'Update Allergen'

    assert_text 'Allergen was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Allergen' do
    visit allergen_url(@allergen)
    click_on 'Destroy this allergen', match: :first

    assert_text 'Allergen was successfully destroyed'
  end
end
