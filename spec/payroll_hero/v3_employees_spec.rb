require 'spec_helper'

RSpec.describe 'V3 Employees' do
  let(:token) { 'l2zsmk8njz0l4w6sxlafl2wh2jot0df' }
  let(:client) { PayrollHero::Api.new(token) }

  describe 'get' do
    it 'works' do
      VCR.use_cassette('employee get me') do
        response = client.v3.employees.get('me')['employee']
        expect(response.firstname).to eq('Piotr')
        expect(response.lastname).to eq('Banasik')
      end
    end
  end
end
