module PayrollHero
  module Api
    module V3
      class Employees < BaseGroup

        def initialize(token)
          client(token)
        end

        def get(id, show_tags: false)
          params = {
            show_tags: show_tags,
          }
          params.delete_if { |k, v| v.nil? }
          client.get("/api/v3/employees/#{id}", params)
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
