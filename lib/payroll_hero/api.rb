require_relative 'api/configuration'

module PayrollHero
  module Api
    extend Configuration

    define_setting :core_base_url
    define_setting :debug, false
    define_setting :application_name, :none

    def self.new(token)
      sections = {
        v2: {
          worksites: V2::Worksites.new(token),
        },
        v3: {
          day_schedules: V3::DaySchedules.new(token),
          employees: V3::Employees.new(token),
        },
        v4: {
          employees: V4::Employees.new(token)
        }
      }
      Hashie::Mash.new(sections)
    end
  end
end

require_relative 'api/version'

require_relative 'api/base_group'

require_relative 'api/errors'
require_relative 'api/client'

require_relative 'api/v2/worksites'

require_relative 'api/v3/day_schedules'
require_relative 'api/v3/employees'

require_relative 'api/v4/employees'
