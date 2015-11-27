# Payrollhero::Api

[ ![Codeship Status for payrollhero/payroll_hero-api](https://codeship.com/projects/d659b9a0-76ec-0133-c19b-5e44421d15ab/status?branch=master)](https://codeship.com/projects/118323)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'payroll_hero-api'
```

And then execute:

    $ bundle

## Usage

The main use is to directly invoke the endpoint groups (roughly corresponding to path prefixes on the endpoints) and
call things on them.

At this point its very rough, there is only a couple of endpoints defined but this should serve as a good framework. 

See the tests for example usages.

## Configuration

```ruby
PayrollHero::Api.configure do |config|
  config.core_base_url = "http://api.payrollhero.ph.dev"
  config.debug = false # when enabled all request info is logged to stdout
  config.application_name = "Test Suite"
end
```

## Development

After checking out the repo, run `bundle install` to install dependencies.
Then, run `rake test` to run the tests.
You can also run `bundle exec pry --gem` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`,
which will create a git tag for the version, push git commits and tags, and push the `.gem` file to Gemfury.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/payrollhero/payroll_hero-api.
This project is intended to be a safe, welcoming space for collaboration,
and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

