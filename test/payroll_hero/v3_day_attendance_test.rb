require 'test_helper'

describe 'V3 Attendance' do
  let(:token) { "56zx2s3deur9yjsdnqg6kk52esek2kh" } # this is only really used to generate the vcr entry
  let(:client) { PayrollHero::Api.new(token) }

  it "works" do
    VCR.use_cassette("v3_attendance days") do
      response = client.v3.attendance_days.list['attendance_days']
      value(response.length).must_be :eql?, 161
    end
  end
end