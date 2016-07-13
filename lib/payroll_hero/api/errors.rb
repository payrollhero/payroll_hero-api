module PayrollHero
  module Api

    module Errors

      class GenericError < StandardError
      end

      class ServerReturnedError < GenericError
        def initialize(code, message)
          @code = code
          @message = message
          super("#{code}: #{message}")
        end

        attr_reader :code, :message
      end

      class BadRequest < ServerReturnedError
      end

      class Unauthorized < ServerReturnedError
      end

      class UnprocessableEntity < ServerReturnedError
      end

      class InternalServerError < ServerReturnedError
      end

    end

  end
end
