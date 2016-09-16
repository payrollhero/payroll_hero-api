$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'payroll_hero/api'

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :faraday
end

PayrollHero::Api.configure do |config|
  config.core_base_url = "http://api.payrollhero.dev"
  config.application_name = "Test Suite"
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.disable_monkey_patching!
  config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.order = :random

  Kernel.srand config.seed
end
