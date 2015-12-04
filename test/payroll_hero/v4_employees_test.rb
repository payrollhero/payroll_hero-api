require 'test_helper'

describe 'V4 Scheduling' do
  let(:token) { "2j86kvirxyyhj3lyvurytj7gcis5l7t" } # this is only really used to generate the vcr entry
  let(:client) { PayrollHero::Api.new(token) }

  describe "standard request" do
    it do
      VCR.use_cassette('v4_employee_get') do
        client.v4.employees.get(5)
      end
    end
  end
end
