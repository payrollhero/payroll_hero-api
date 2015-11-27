module PayrollHero
  module Api
    module V3
      class Scheduling < BaseGroup

        def initialize(token)
          client(token)
        end

        def list(page: nil, per_page: nil, start_date: nil, end_date: nil, permissions: false, breaks: false, worksite_id: nil, excluded_worksite_id: nil, employee_id: nil)
          params = {
            page: page,
            per_page: per_page,
            start_date: start_date,
            end_date: end_date,
            permissions: permissions,
            breaks: breaks,
            worksite_id: worksite_id,
            excluded_worksite_id: excluded_worksite_id,
            employee_id: employee_id,
          }
          params.delete_if { |k, v| v.nil? }
          client.get("/api/v3/day_schedules", params)
        end

        def client(token = nil)
          @client ||= begin
            Client.new(token, base_url_for(:core))
          end
        end

      end
    end
  end
end
