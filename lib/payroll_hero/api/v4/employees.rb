module PayrollHero
  module Api
    module V4
      # Employees Endpoint
      class Employees < BaseGroup
        # Implements the interface to get a list of accessible employees.
        #
        # @return [Hashie::Mash]
        # @param [Array|Symbol] only - Attribute names to be included on the response
        # @param [Array|Symbol] except - Attribute names to be excluded on the response
        # @param [Array|Symbol] include - Association names to be included in the response
        def list(only: [], except: [], include: [], page: nil, per_page: nil, **params)
          combined_params = params.merge(
            remove_empty_values_from!(
              only: Array(only),
              except: Array(except),
              include: Array(include),
              page: page,
              per_page: per_page
            )
          )

          client.get "/api/v4/employees", combined_params
        end

        # implements the interface to get a single Employee record
        #
        # @return [Hashie::Mash]
        # @param [Fixnum|String] id
        # @param [Array|Symbol] only - Attribute names to be included on the response
        # @param [Array|Symbol] except - Attribute names to be excluded on the response
        # @param [Array|Symbol] include - Association names to be included in the response
        def get(id, only: nil, except: nil, include: nil, **params)
          fetch id, only: only, except: except, include: include, **params
        end

        # Implements the interface to get a list of the API token owner's subordinates
        #
        # @return [Hashie::Mash]
        # @param [Fixnum|String] id
        # @param [Array|Symbol] only - Attribute names to be included on the response
        # @param [Array|Symbol] except - Attribute names to be excluded on the response
        # @param [Array|Symbol] include - Association names to be included in the response
        def subordinates(id, only: [], except: [], include: [], page: nil, per_page: nil, **params)
          fetch "#{id}/subordinates", only: only, except: except, include: include, page: page, per_page: per_page, **params
        end

        # Implements the interface to get a list of the API token owner's superiors
        #
        # @return [Hashie::Mash]
        # @param [Fixnum|String] id
        # @param [Array|Symbol] only - Attribute names to be included on the response
        # @param [Array|Symbol] except - Attribute names to be excluded on the response
        # @param [Array|Symbol] include - Association names to be included in the response
        def superiors(id, only: [], except: [], include: [], page: nil, per_page: nil, **params)
          fetch"#{id}/superiors", only: only, except: except, include: include, page: page, per_page: per_page, **params
        end

        # Final Pay Feature: Convert all applicable leaves to work time
        # only,except,include and paging params don't apply here as it's a write call
        # expected attributes[Hash]: { leaves: [ { name: 'Vacation', number_of_days: 28.0 },...] }

        def convert_leaves(id, attributes)
          client.put "/api/v4/employees/#{id}/convert_leaves", attributes
        end

        private

        def fetch(identifier, only:, except:, include:, page: nil, per_page: nil, **params)
          combined_params = params.merge(
            remove_empty_values_from!(
              only: Array(only),
              except: Array(except),
              include: Array(include),
              page: page,
              per_page: per_page
            )
          )

          client.get "/api/v4/employees/#{identifier}", combined_params
        end
      end
    end
  end
end
