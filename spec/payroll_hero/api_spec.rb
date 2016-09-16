require 'spec_helper'

RSpec.describe 'APi Test' do
  it 'that_it_has_a_version_number' do
    expect(::PayrollHero::Api::VERSION).not_to be_nil
  end
end
