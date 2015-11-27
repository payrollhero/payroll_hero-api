require 'test_helper'

describe 'V3 Scheduling' do
  let(:token) { "l2zsmk8njz0l4w6sxlafl2wh2jot0df" } # this is only really used to generate the vcr entry
  let(:client) { PayrollHero::Api.new(token) }

  it "works" do
    VCR.use_cassette("scheduling list") do
      response = client.v3.day_schedules.list['day_schedules']
      value(response.length).must_be :eql?, 7
    end
  end
end
