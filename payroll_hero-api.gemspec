# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'payroll_hero/api/version'

Gem::Specification.new do |spec|
  spec.name          = 'payroll_hero-api'
  spec.version       = PayrollHero::Api::VERSION
  spec.authors       = ['Piotr Banasik']
  spec.email         = ['piotr@payrollhero.com']

  spec.summary       = %q{Ruby API Client for PayrollHero Apis}
  spec.description   = %q{Provides a clean canonical interface to accessing PayrollHero APIs with Ruby}
  spec.homepage      = "http://github.com/payrollhero/"
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'faraday_middleware'
  spec.add_runtime_dependency 'hashie'
  spec.add_runtime_dependency 'retries'

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
