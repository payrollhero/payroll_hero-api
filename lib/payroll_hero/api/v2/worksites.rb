module PayrollHero
  module Api
    module V2
      class Worksites < BaseGroup

        def initialize(token)
          client(token)
        end

        def list(page: nil, per_page: nil)
          params = {
            page: page,
            per_page: per_page,
          }
          params.delete_if { |k, v| v.nil? }
          client.get("/api/v2/worksites", params)
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
