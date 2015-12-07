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
          fetch(id, only, except, include)
        end

        # Implements the interface to get a list of the API token owner's subordinates
        #
        # @return [Hashie::Mash]
        # @param [Fixnum|String] id
        # @param [Array|Symbol] only - Attribute names to be included on the response
        # @param [Array|Symbol] except - Attribute names to be excluded on the response
        # @param [Array|Symbol] include - Association names to be included in the response
        def subordinates(id, only: [], except: [], include: [])
          fetch("#{id}/subordinates", only, except, include)
        end

        # Implements the interface to get a list of the API token owner's superiors
        #
        # @return [Hashie::Mash]
        # @param [Fixnum|String] id
        # @param [Array|Symbol] only - Attribute names to be included on the response
        # @param [Array|Symbol] except - Attribute names to be excluded on the response
        # @param [Array|Symbol] include - Association names to be included in the response
        def superiors(id, only: [], except: [], include: [])
          fetch("#{id}/superiors", only, except, include)
        end

        private

        def fetch(identifier, only, except, include)
          params = {
            only: Array(only),
            except: Array(except),
            include: Array(include)
          }
          remove_empty_values_from!(params)
          client.get("/api/v4/employees/#{identifier}", params)
        end
      end
    end
  end
end
