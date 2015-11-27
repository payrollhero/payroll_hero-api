module PayrollHero
  module Api

    class BaseGroup
      attr_reader :client

      private

      def base_url_for(name)
        PayrollHero::Api.send("#{name}_base_url")
      end

      def new_client(token, name)
        Client.new(token, base_url_for(name))
      end
    end

  end
end
