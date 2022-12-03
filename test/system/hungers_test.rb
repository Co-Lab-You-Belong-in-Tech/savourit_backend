require 'application_system_test_case'

class HungersTest < ApplicationSystemTestCase
  setup do
    @hunger = hungers(:one)
  end

  test 'visiting the index' do
    visit hungers_url
    assert_selector 'h1', text: 'Hungers'
  end

  test 'should create hunger' do
    visit hungers_url
    click_on 'New hunger'

    fill_in 'Value', with: @hunger.value
    click_on 'Create Hunger'

    assert_text 'Hunger was successfully created'
    click_on 'Back'
  end

  test 'should update Hunger' do
    visit hunger_url(@hunger)
    click_on 'Edit this hunger', match: :first

    fill_in 'Value', with: @hunger.value
    click_on 'Update Hunger'

    assert_text 'Hunger was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Hunger' do
    visit hunger_url(@hunger)
    click_on 'Destroy this hunger', match: :first

    assert_text 'Hunger was successfully destroyed'
  end
end
