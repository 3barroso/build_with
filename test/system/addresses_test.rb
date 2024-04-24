# frozen_string_literal: true

require 'application_system_test_case'

class AddressesTest < ApplicationSystemTestCase
  setup do
    @address = addresses(:one)
  end

  test 'visiting the index' do
    visit addresses_url
    assert_selector 'h1', text: 'Addresses'
  end

  test 'should create address' do
    visit addresses_url
    click_on 'New address'

    fill_in 'City', with: @address.city
    fill_in 'Country', with: @address.country
    fill_in 'Fips code', with: @address.fips_code
    fill_in 'Postal code', with: @address.postal_code
    fill_in 'State', with: @address.state
    fill_in 'Street', with: @address.street
    fill_in 'Street number', with: @address.street_number
    click_on 'Create Address'

    assert_text 'Address was successfully created'
    click_on 'Back'
  end

  test 'should update Address' do
    visit address_url(@address)
    click_on 'Edit this address', match: :first

    fill_in 'City', with: @address.city
    fill_in 'Country', with: @address.country
    fill_in 'Fips code', with: @address.fips_code
    fill_in 'Postal code', with: @address.postal_code
    fill_in 'State', with: @address.state
    fill_in 'Street', with: @address.street
    fill_in 'Street number', with: @address.street_number
    click_on 'Update Address'

    assert_text 'Address was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Address' do
    visit address_url(@address)
    click_on 'Destroy this address', match: :first

    assert_text 'Address was successfully destroyed'
  end
end
