module PayrollHero
  module Api

    module Errors

      class GenericError < Exception
      end

      class ServerReturnedError < GenericError
        def initialize(code, message)
          @code = code
          super("#{code}: #{message}")
        end

        attr_reader :code
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
