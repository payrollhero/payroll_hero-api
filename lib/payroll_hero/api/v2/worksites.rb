module PayrollHero
  module Api
    module V2

      # Worksites Endpoint
      class Worksites < BaseGroup
        def initialize(token)
          @client = new_client(token, :core)
        end

        # implements the interface to the Worksites List endpoint
        #
        # @param [Fixnum] page
        # @param [Fixnum] per_page
        # @return [Hashie::Mash]
        def list(page: nil, per_page: nil)
          params = {
            page: page,
            per_page: per_page,
          }
          params.delete_if { |k, v| v.nil? }
          client.get("/api/v2/worksites", params)
        end
      end

    end
  end
end
