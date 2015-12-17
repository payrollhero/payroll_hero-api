require 'faraday'
require 'faraday_middleware'
require 'retries'

module PayrollHero
  module Api

    class Client
      attr_reader :client

      def initialize(token, base_url)
        headers = {
          'User-Agent' => user_agent_string,
        }
        params = {
          token: token,
        }
        @client = Faraday.new(url: base_url) do |faraday|
          faraday.request :url_encoded
          faraday.response :logger if PayrollHero::Api.debug

          faraday.use FaradayMiddleware::Mashify
          faraday.response :json, content_type: /\bjson$/

          faraday.headers.merge! headers
          faraday.params.merge! params

          faraday.adapter Faraday.default_adapter
        end
      end

      def get(path, params)
        rsp = wrap_request { client.get(path, params) }
        validate_response(rsp)
        rsp.body
      end

      def post(path, params)
        response = wrap_request { client.post(path, params) }
        validate_response(response)
        response.body
      end

      private

      def error_from(response)
        klass = {
          401 => Errors::Unauthorized,
          422 => Errors::UnprocessableEntity,
          500 => Errors::InternalServerError,
        }[response.status] || Errors::ServerReturnedError

        case response.body
        when Hash
          if response.body['error'] && response.body['error_description']
            raise klass.new(response.body['error'], response.body['error_description'])
          else
            raise klass.new('unknown', response.body.inspect)
          end
        else
          raise klass.new('unknown', response.body)
        end
      end

      def validate_response(response)
        case response.status
        when 400..499, 500..599
          raise error_from(response)
        when 200
          # this is cool, just return
          return
        else
          raise "unhandled error: #{response.status}"
        end
      end

      def user_agent_string
        if PayrollHero::Api.application_name != :none
          "#{PayrollHero::Api.application_name} (PayrollHero::Api #{PayrollHero::Api::VERSION})"
        else
          "(PayrollHero::Api #{PayrollHero::Api::VERSION})"
        end
      end

      def wrap_request
        with_retries(max_tries: 3) { yield }
      end
    end

  end
end
