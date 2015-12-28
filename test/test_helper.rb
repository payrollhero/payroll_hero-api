$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'payroll_hero/api'

require 'minitest/autorun'
require 'minitest/reporters'

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new(reporter_options)]

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "test/fixtures/vcr_cassettes"
  config.hook_into :webmock
end

PayrollHero::Api.configure do |config|
  config.core_base_url = "http://api.payrollhero.dev"
  config.application_name = "Test Suite"
end
