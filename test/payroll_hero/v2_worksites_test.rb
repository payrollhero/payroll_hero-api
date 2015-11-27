require 'test_helper'

describe "V2 Worksites" do
  let(:token) { "l2zsmk8njz0l4w6sxlafl2wh2jot0df" } # this is only really used to generate the vcr entry
  let(:client) { PayrollHero::Api::V2::Worksites.new(token) }

  it "works" do
    VCR.use_cassette("worksites list") do
      response = client.list['worksites']
      value(response.length).must_be :eql?, 1
      value(response[0].name).must_be :eql?, 'Default worksite'
    end
  end
end
