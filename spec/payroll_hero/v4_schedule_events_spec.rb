require 'spec_helper'

RSpec.describe 'V4 DaySchedules' do
  let(:token) { 'l306j1iq29qh7eryfd3znpqgdoaan1p' }
  let(:client) { PayrollHero::Api.new(token) }


  let(:attributes) {
    {
      time_zone: 'UTC',
      start_date: Date.new(2016,8,29),
      end_date: Date.new(2016,8,30),
      employee_ids: '1'
    }
  }

  it 'works' do
    VCR.use_cassette('v4_schedule_events') do
      response = client.v4.schedule_events.list(**attributes)['schedule_events']
      expect(response.length).to eq(2)
    end
  end
end
