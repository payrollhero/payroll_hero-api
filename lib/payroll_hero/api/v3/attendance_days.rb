module PayrollHero
  module Api
    module V3

      #AttendanceDays Endpoint
      class AttendanceDays < BaseGroup
        # implements the interface to the AttendanceDays List endpoint
        #
        # @return [Hashie::Mash]
        # @param [Fixnum] page
        # @param [Fixnum] per_page
        # @param [Date] start_date
        # @param [Date] end_date
        # @param [Fixnum] worksite_id
        # @param [Fixnum] excluded_worksite_id
        # @param [Fixnum] employee_id
        def list(page: nil, per_page: nil, start_date: nil, end_date: nil, worksite_id: nil, excluded_worksite_id: nil, employee_id: nil)
          params = {
            page: page,
            per_page: per_page,
            start_date: start_date,
            end_date: end_date,
            worksite_id: worksite_id,
            excluded_worksite_id: excluded_worksite_id,
            employee_id: employee_id,
          }
          remove_nil_values_from!(params)
          client.get("/api/v3/attendance_days", params)
        end
      end

    end
  end
end
