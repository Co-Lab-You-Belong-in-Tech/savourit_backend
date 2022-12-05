require 'test_helper'

class HungersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hunger = hungers(:one)
  end

  test 'should get index' do
    get hungers_url
    assert_response :success
  end

  test 'should get new' do
    get new_hunger_url
    assert_response :success
  end

  test 'should create hunger' do
    assert_difference('Hunger.count') do
      post hungers_url, params: { hunger: { value: @hunger.value } }
    end

    assert_redirected_to hunger_url(Hunger.last)
  end

  test 'should show hunger' do
    get hunger_url(@hunger)
    assert_response :success
  end

  test 'should get edit' do
    get edit_hunger_url(@hunger)
    assert_response :success
  end

  test 'should update hunger' do
    patch hunger_url(@hunger), params: { hunger: { value: @hunger.value } }
    assert_redirected_to hunger_url(@hunger)
  end

  test 'should destroy hunger' do
    assert_difference('Hunger.count', -1) do
      delete hunger_url(@hunger)
    end

    assert_redirected_to hungers_url
  end
end
