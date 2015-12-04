module PayrollHero
  module Api
    module V4
      # Employees Endpoint
      class Employees < BaseGroup
        def initialize(token)
          @client = new_client(token, :core)
        end

        # implements the interface to get a single Employee record
        #
        # @return [Hashie::Mash]
        # @param [Fixnum|String] id
        # @param [Hash] params
        def get(id, params={})
          params = params.select { |kev, _| key.in?([:only, :except, :include]) && !value.nil? }
          client.get("/api/v4/employees/#{id}", params)
        end
      end
    end
  end
end
