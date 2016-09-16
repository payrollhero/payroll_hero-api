require 'spec_helper'

RSpec.describe 'V4 Leaves' do
  let(:token) { '83hckixg8fqyse9aozjfb03grs9kgrl' }
  let(:client) { PayrollHero::Api.new(token) }

  describe '#create' do
    let(:attributes) do
      { leave: { from_date: '2115-12-01', to_date: '2115-12-10', paid_dates: (%w(2115-12-04 2115-12-06)), employee_id: 74 } }
    end

    it 'works' do
      VCR.use_cassette('v4_leave_create') do
        response = client.v4.leaves.create(attributes)
        expect(response).to eq('leave' => { 'status' => 'created' })
      end
    end
  end

  describe '#destroy' do
    let(:id) { 'core-transaction-id' }

    it 'works' do
      VCR.use_cassette('v4_leave_destroy') do
        response = client.v4.leaves.destroy(id)
        expect(response).to eq('status' => 'deleted')
      end
    end
  end
end
