require 'spec_helper'

RSpec.describe 'V4 Scheduling' do
  let(:token) { '2j86kvirxyyhj3lyvurytj7gcis5l7t' }
  let(:client) { PayrollHero::Api.new(token) }

  describe 'list' do
    let(:expected_keys) do
      %w(
        id
        account_id
        employment_date
        employee_number
        works_on_holidays
        firstname
        lastname
        gender
        timezone
        clock_on_non_work_days
        tags
        position_name
      )
    end

    it do
      VCR.use_cassette('v4_employees') do
        response = client.v4.employees.list
        expect(response['employees'].first.keys).to eq(expected_keys)
      end
    end
  end

  describe 'get' do
    let(:expected_keys) do
      %w(
        id
        account_id
        firstname
        lastname
        gender
        timezone
        clock_on_non_work_days
        works_on_holidays
        avatar
        employment_date
        date_of_birth
        primary_worksite_id
        employee_number
      )
    end

    it do
      VCR.use_cassette('v4_employee_get') do
        response = client.v4.employees.get 5
        expect(response['employee'].keys).to eq(expected_keys)
      end
    end
  end

  describe 'subordinates' do
    it do
      VCR.use_cassette('v4_employee_subordinates') do
        response = client.v4.employees.subordinates(5)
        expect(response['employees'].size).to eq(3)
      end
    end
  end

  describe 'superiors' do
    it do
      VCR.use_cassette('v4_employee_superiors') do
        response = client.v4.employees.superiors(5)
        expect(response['employees'].size).to eq(3)
      end
    end
  end
end
