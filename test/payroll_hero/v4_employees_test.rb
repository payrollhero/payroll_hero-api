require 'test_helper'

describe 'V4 Scheduling' do
  let(:token) { "2j86kvirxyyhj3lyvurytj7gcis5l7t" } # this is only really used to generate the vcr entry
  let(:client) { PayrollHero::Api.new(token) }

  describe "get" do
    it do
      VCR.use_cassette('v4_employee_get') do
        response = client.v4.employees.get(5)
        expect(response['employee'].keys).must_equal([
          "id",
          "account_id",
          "firstname",
          "lastname",
          "gender",
          "timezone",
          "clock_on_non_work_days",
          "works_on_holidays",
          "avatar",
          "employment_date",
          "date_of_birth",
          "primary_worksite_id",
          "employee_number"
        ])
      end
    end
  end

  describe "subordinates" do
    it do
      VCR.use_cassette('v4_employee_subordinates') do
        response = client.v4.employees.subordinates(5)
        expect(response['employees'].size).must_equal(3)
      end
    end
  end

  describe "superiors" do
    it do
      VCR.use_cassette('v4_employee_superiors') do
        response = client.v4.employees.superiors(5)
        expect(response['employees'].size).must_equal(3)
      end
    end
  end
end
