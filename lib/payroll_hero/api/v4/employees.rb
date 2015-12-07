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
        # @param [Array|Symbol] only - Attribute names to be included on the response
        # @param [Array|Symbol] except - Attribute names to be excluded on the response
        # @param [Array|Symbol] include - Association names to be included in the response
        def get(id, only: nil, except: nil, include: nil)
          params = {
            only: Array(only),
            except: Array(except),
            include: Array(include)
          }
          remove_empty_values_from!(params)
          client.get("/api/v4/employees/#{id}", params)
        end
      end
    end
  end
end
