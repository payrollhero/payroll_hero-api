require 'spec_helper'

RSpec.describe 'APi Test' do
  it 'that_it_has_a_version_number' do
    expect(::PayrollHero::Api::VERSION).not_to be_nil
  end

  it "can be configured" do
    expect {
      PayrollHero::Api.configure do |config|
        config.time_base_url = "https://time.payrollhero.com"
        config.leave_management_base_url = "https://leave-management.payrollhero.com"
      end
    }.not_to raise_error
    expect(PayrollHero::Api.time_base_url).to eq "https://time.payrollhero.com"
    expect(PayrollHero::Api.leave_management_base_url).to eq "https://leave-management.payrollhero.com"
  end
end
