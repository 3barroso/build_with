# frozen_string_literal: true

require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)
    @company2 = companies(:two)
  end

  test 'should get index' do
    get companies_url
    assert_response :success
  end

  test 'should get new' do
    get new_company_url
    assert_response :success
  end

  test 'should create company' do
    assert_difference('Company.count') do
      post companies_url, params: { company: { name: @company.name } }
    end

    assert_redirected_to company_url(Company.last)
  end

  test 'should check unique slug before creating company' do
    assert_no_changes('Company.count') do
      post companies_url, params: { company: { name: @company.name, slug: @company2.slug } }
    end

    assert_response :unprocessable_entity
  end

  test 'should show company' do
    get company_url(@company.slug)
    assert_response :success
  end

  test 'should get edit' do
    get edit_company_url(@company.slug)
    assert_response :success
  end

  test 'should update company' do
    patch company_url(@company.slug), params: { company: { name: @company.name } }
    assert_redirected_to company_url(@company)
  end

  test 'should check unique slug before updating company' do
    patch company_url(@company.slug), params: { company: { name: @company.name, slug: @company2.slug } }
    assert_response :unprocessable_entity
  end

  test 'should destroy company' do
    assert_difference('Company.count', -1) do
      delete company_url(@company.slug)
    end

    assert_redirected_to companies_url
  end
end
