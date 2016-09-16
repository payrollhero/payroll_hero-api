require 'spec_helper'

RSpec.describe 'V2 Worksites' do
  let(:token) { 'l2zsmk8njz0l4w6sxlafl2wh2jot0df' }
  let(:client) { PayrollHero::Api.new(token) }

  it 'works' do
    VCR.use_cassette('worksites list') do
      response = client.v2.worksites.list['worksites']
      expect(response.length).to eq(1)
      expect(response[0].name).to eq('Default worksite')
    end
  end
end
