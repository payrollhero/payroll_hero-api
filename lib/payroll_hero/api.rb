require_relative 'api/configuration'

module PayrollHero
  module Api
    extend Configuration

    define_setting :core_base_url
    define_setting :debug, false
    define_setting :application_name, :none
  end
end

require_relative 'api/version'

require_relative 'api/base_group'

require_relative 'api/errors'
require_relative 'api/client'

require_relative 'api/v2/worksites'

require_relative 'api/v3/scheduling'
require_relative 'api/v3/employees'
