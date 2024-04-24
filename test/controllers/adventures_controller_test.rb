# frozen_string_literal: true

require 'test_helper'

class AdventuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adventure = adventures(:one)
    @address = addresses(:one)
  end

  test 'should get index' do
    get adventures_url
    assert_response :success
  end

  test 'should get new' do
    get new_adventure_url
    assert_response :success
  end

  test 'should create adventure' do
    assert_difference('Adventure.count') do
      post adventures_url, params: { adventure: { active: @adventure.active, description: @adventure.description, shareable: @adventure.shareable, status: @adventure.status, target_completion: @adventure.target_completion, title: @adventure.title } }
    end

    assert_redirected_to adventure_url(Adventure.last)
  end

  test 'should create addresses with adventure creation' do
    assert_difference ['Address.count', 'Adventure.count'], 1 do
      post adventures_url, params: { adventure: { active: @adventure.active, 'adventure_addresses_attributes'=>{'0'=>{'description'=>'home reno', 'address_attributes'=>{'city'=>@address.city, 'street_number'=>'123', 'street'=>@address.street, 'state'=>@address.state }}}}}
    end
  end

  test 'should find exisiting addresses with adventure creation' do
    assert_difference -> { Address.count } => 0, -> { Adventure.count } => 1 do
      post adventures_url, params: { adventure: { active: @adventure.active, 'adventure_addresses_attributes'=>{'0'=>{'description'=>'home reno', 'address_attributes'=>{'city'=>@address.city, 'street_number'=>@address.street_number, 'street'=>@address.street, 'state'=>@address.state }}}}}
    end
  end

  test 'should show adventure' do
    get adventure_url(@adventure)
    assert_response :success
  end

  test 'should get edit' do
    get edit_adventure_url(@adventure)
    assert_response :success
  end

  test 'should update adventure' do
    patch adventure_url(@adventure), params: { adventure: { active: @adventure.active, description: @adventure.description, shareable: @adventure.shareable, status: @adventure.status, target_completion: @adventure.target_completion, title: @adventure.title } }
    assert_redirected_to adventure_url(@adventure)
  end

  test 'should destroy adventure' do
    assert_difference('Adventure.count', -1) do
      delete adventure_url(@adventure)
    end

    assert_redirected_to adventures_url
  end
end
