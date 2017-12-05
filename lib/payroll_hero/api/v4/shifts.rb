module PayrollHero
  module Api
    module V4
      class Shifts < BaseGroup
        def list(**params)
          client.get '/api/v4/shifts', params
        end
      end
    end
  end
end
