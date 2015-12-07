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
        def get(id, only: nil, except: nil, include: nil)
          params = {}.tap do |query_params|
            query_params[:only] = only if only
            query_params[:except] = except if except
            query_params[:include] = include if include
          end
          client.get("/api/v4/employees/#{id}", params)
        end
      end
    end
  end
end
