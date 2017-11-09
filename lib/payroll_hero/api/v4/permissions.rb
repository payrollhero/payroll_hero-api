module PayrollHero
  module Api
    module V4
      # Permissions Endpoint
      class Permissions < BaseGroup
        def list(**params)
          client.get("/api/v4/permissions", params)
        end
      end
    end
  end
end
