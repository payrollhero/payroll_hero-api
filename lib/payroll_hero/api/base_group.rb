module PayrollHero
  module Api

    class BaseGroup
      def initialize(token, cookies = {})
        @client = new_client(token, :core, cookies)
      end


      attr_reader :client

      private

      def base_url_for(name)
        PayrollHero::Api.send("#{name}_base_url")
      end

      def new_client(token, name, cookies)
        Client.new(token, base_url_for(name), cookies)
      end

      def remove_nil_values_from!(hash)
        hash.delete_if { |_, value| value.nil? }
      end

      def remove_empty_values_from!(hash)
        hash.delete_if { |_, value| value.nil? || value.empty? }
      end
    end
  end
end
