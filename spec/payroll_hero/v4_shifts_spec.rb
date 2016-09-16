require 'spec_helper'

RSpec.describe 'V4 Shifts' do
  let(:token) { '4numx2k58vd3y0qw63r6dcqdkxcv3h0' }
  let(:client) { PayrollHero::Api.new(token) }

  describe 'list' do
    let(:expected_response) do
      {
        'shifts' => [
          {
            'id' => 1,
            'name' => '08:00 - 16:00',
            'category_name' => '',
            'items' => [
              { 'kind' => 'work', 'start_time' => '08:00', 'end_time' => '16:00', 'start_day' => 0, 'end_day' => 0 }
            ]
          },
          {
            'id' => 3,
            'name' => '10:00 - 18:00',
            'category_name' => '',
            'items' => [
              { 'kind' => 'work', 'start_time' => '10:00', 'end_time' => '18:00', 'start_day' => 0, 'end_day' => 0 }
            ]
          }
        ]
      }
    end

    it do
      VCR.use_cassette('v4_shifts_list') do
        response = client.v4.shifts.list
        expect(response).to eq(expected_response)
      end
    end
  end
end
