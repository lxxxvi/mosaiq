module Errors
  class InvalidDimensionArgument < StandardError
    def initialize(key, value)
      msg = "Argument '#{key}' cannot be '#{value.inspect}'. Please provide a number greater than 0."
      super msg
    end
  end
end
