require 'spec_helper'

RSpec.describe 'V3 Scheduling' do
  let(:token) { 'l2zsmk8njz0l4w6sxlafl2wh2jot0df' }
  let(:client) { PayrollHero::Api.new(token) }

  it 'works' do
    VCR.use_cassette('scheduling list') do
      response = client.v3.day_schedules.list['day_schedules']
      expect(response.length).to eq(7)
    end
  end
end
