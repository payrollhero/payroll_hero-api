require 'test_helper'

describe 'V3 Employees' do
  let(:token) { "l2zsmk8njz0l4w6sxlafl2wh2jot0df" } # this is only really used to generate the vcr entry
  let(:client) { PayrollHero::Api::V3::Employees.new(token) }

  describe "get" do

    it "works" do
      VCR.use_cassette('employee get me') do
        response = client.get('me')['employee']
        value(response.firstname).must_be :eql?, 'Piotr'
        value(response.lastname).must_be :eql?, 'Banasik'
      end
    end

  end
end
