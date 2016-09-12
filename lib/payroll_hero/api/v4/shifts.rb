module PayrollHero
  module Api
    module V4
      class Shifts < BaseGroup
        def list
          client.get('/api/v4/shifts')
        end
      end
    end
  end
end
