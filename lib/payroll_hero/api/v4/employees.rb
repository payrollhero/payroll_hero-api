module PayrollHero
  module Api
    module V4
      # Employees Endpoint
      class Employees < BaseGroup
        # implements the interface to get a single Employee record
        #
        # @return [Hashie::Mash]
        # @param [Fixnum|String] id
        # @param [Array|Symbol] only - Attribute names to be included on the response
        # @param [Array|Symbol] except - Attribute names to be excluded on the response
        # @param [Array|Symbol] include - Association names to be included in the response
        def get(id, only: nil, except: nil, include: nil)
          fetch(id, only: only, except: except, include: include)
        end

        # Implements the interface to get a list of the API token owner's subordinates
        #
        # @return [Hashie::Mash]
        # @param [Fixnum|String] id
        # @param [Array|Symbol] only - Attribute names to be included on the response
        # @param [Array|Symbol] except - Attribute names to be excluded on the response
        # @param [Array|Symbol] include - Association names to be included in the response
        def subordinates(id, only: [], except: [], include: [], page: nil, per_page: nil)
          fetch("#{id}/subordinates", only: only, except: except, include: include, page: page, per_page: per_page)
        end

        # Implements the interface to get a list of the API token owner's superiors
        #
        # @return [Hashie::Mash]
        # @param [Fixnum|String] id
        # @param [Array|Symbol] only - Attribute names to be included on the response
        # @param [Array|Symbol] except - Attribute names to be excluded on the response
        # @param [Array|Symbol] include - Association names to be included in the response
        def superiors(id, only: [], except: [], include: [], page: nil, per_page: nil)
          fetch("#{id}/superiors", only: only, except: except, include: include, page: page, per_page: per_page)
        end

        private

        def fetch(identifier, only:, except:, include:, page: nil, per_page: nil)
          params = {
            only: Array(only),
            except: Array(except),
            include: Array(include),
            page: page,
            per_page: per_page,
          }
          remove_empty_values_from!(params)
          client.get("/api/v4/employees/#{identifier}", params)
        end
      end
    end
  end
end
