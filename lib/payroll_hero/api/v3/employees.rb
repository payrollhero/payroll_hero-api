module PayrollHero
  module Api
    module V3

      # Employees Endpoint
      class Employees < BaseGroup
        # implements the interface to get a single Employee record
        #
        # @return [Hashie::Mash]
        # @param [Fixnum|String] id
        # @param [TrueClass|FalseClass] show_tags
        def get(id, show_tags: false)
          params = {
            show_tags: show_tags,
          }
          remove_nil_values_from!(params)
          client.get("/api/v3/employees/#{id}", params)
        end
      end
    end
  end
end
