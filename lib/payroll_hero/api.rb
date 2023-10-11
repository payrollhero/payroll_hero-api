require_relative 'api/configuration'

module PayrollHero
  module Api
    extend Configuration

    define_setting :core_base_url
    define_setting :time_base_url
    define_setting :leave_management_base_url
    define_setting :debug, false
    define_setting :application_name, :none

    def self.new(token, cookies = {})
      sections = {
        v2: {
          worksites: V2::Worksites.new(token, cookies),
        },
        v3: {
          day_schedules: V3::DaySchedules.new(token, cookies),
          employees: V3::Employees.new(token, cookies),
          attendance_days: V3::AttendanceDays.new(token, cookies),
        },
        v4: {
          employees: V4::Employees.new(token, cookies),
          leaves: V4::Leaves.new(token, cookies),
          permissions: V4::Permissions.new(token, cookies),
          shifts: V4::Shifts.new(token, cookies),
          schedule_events: V4::ScheduleEvents.new(token, cookies),
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
require_relative 'api/v3/attendance_days'

require_relative 'api/v4/employees'
require_relative 'api/v4/leaves'
require_relative 'api/v4/permissions'
require_relative 'api/v4/shifts'
require_relative 'api/v4/schedule_events'
