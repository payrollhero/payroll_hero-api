module PayrollHero
  module Api
    module V3

      # Employees Endpoint
      class Employees < BaseGroup
        def initialize(token)
          @client = new_client(token, :core)
        end

        # implements the interface to get a single Employee record
        #
        # @return [Hashie::Mash]
        # @param [Fixnum|String] id
        # @param [TrueClass|FalseClass] show_tags
        def get(id, show_tags: false)
          params = {
            show_tags: show_tags,
          }
          params.delete_if { |k, v| v.nil? }
          client.get("/api/v3/employees/#{id}", params)
        end
      end

    end
  end
end
