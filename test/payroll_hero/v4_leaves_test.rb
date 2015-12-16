require 'test_helper'

describe 'V4 Leaves' do
  let(:token) { "83hckixg8fqyse9aozjfb03grs9kgrl" } # this is only really used to generate the vcr entry
  let(:client) { PayrollHero::Api.new(token) }

  describe "#create" do
    let(:attributes) do
      {
        leave: {
          from_date: '2115-12-01',
          to_date: '2115-12-10',
          paid_dates: ['2115-12-04', '2115-12-06'],
          employee_id: 74
        }
      }
    end
    it do
      VCR.use_cassette('v4_leave_create') do
        client.v4.leaves.create(attributes)
      end
    end
  end
end
