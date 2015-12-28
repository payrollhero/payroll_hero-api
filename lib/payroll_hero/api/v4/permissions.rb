module PayrollHero
  module Api
    module V4
      # Permissions Endpoint
      class Permissions < BaseGroup
        def list
          client.get("/api/v4/permissions")
        end
      end
    end
  end
end
