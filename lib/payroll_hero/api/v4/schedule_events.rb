module PayrollHero
  module Api
    module V4
      class ScheduleEvents < BaseGroup

        def list(
          time_zone: nil,
          start_time: nil,
          end_time: nil,
          start_date: nil,
          end_date: nil,
          employee_ids: [],
          worksite_ids: [],
          excluded_worksite_ids: nil,
          shared_events: nil,
          page: nil,
          per_page: nil,
          **params
        )
          combined_params = params.merge time_zone: time_zone,
                                         start_time: start_time,
                                         end_time: end_time,
                                         start_date: start_date,
                                         end_date: end_date,
                                         employee_ids: employee_ids,
                                         worksite_ids: worksite_ids,
                                         excluded_worksite_ids: excluded_worksite_ids,
                                         shared_events: shared_events,
                                         page: page,
                                         per_page: per_page

          remove_nil_values_from! combined_params
          client.get '/api/v4/schedule_events', combined_params
        end

      end
    end
  end
end
