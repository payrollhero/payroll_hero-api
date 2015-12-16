module PayrollHero
  module Api
    module V4
      # Leaves Endpoint
      class Leaves < BaseGroup
        # Creates a leave record.
        #
        # @param [Hash] attributes - Attributes of the Leave to be created.
        # @return [Hashie::Mash]
        def create(attributes)
          client.post("/api/v4/leaves", attributes)
        end
      end
    end
  end
end
