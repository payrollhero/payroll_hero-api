module PayrollHero
  module Api

    module Errors

      class GenericError < StandardError
      end

      class ServerReturnedError < GenericError
        def initialize(code, message)
          @code = code
          @error_details = message
          super("#{code}: #{message}")
        end

        attr_reader :code, :error_details
      end

      class BadRequest < ServerReturnedError # 400
      end

      class Unauthorized < ServerReturnedError # 401
      end

      class Forbidden < ServerReturnedError # 403
      end

      class NotFound < ServerReturnedError # 404
      end

      class MethodNotAllowed < ServerReturnedError # 405
      end

      class NotAcceptable < ServerReturnedError # 406
      end

      class UnprocessableEntity < ServerReturnedError # 422
      end

      class InternalServerError < ServerReturnedError
      end

    end

  end
end
