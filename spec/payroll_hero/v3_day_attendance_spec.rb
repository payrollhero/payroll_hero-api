require 'spec_helper'

RSpec.describe 'V3 Attendance' do
  let(:token) { '56zx2s3deur9yjsdnqg6kk52esek2kh' }
  let(:client) { PayrollHero::Api.new(token) }

  it 'works' do
    VCR.use_cassette('v3_attendance days') do
      response = client.v3.attendance_days.list['attendance_days']
      expect(response.length).to eq(161)
    end
  end
end
