# frozen_string_literal: true

module Errors
  # Raised when x or y arguments are not > 0
  class InvalidDimensionArgument < StandardError
    def initialize(key, value)
      msg = "Argument '#{key}' cannot be '#{value.inspect}'. Please provide a number greater than 0."
      super msg
    end
  end

  # Raised when palette argument is empty
  class InvalidPaletteArgument < StandardError
    def initialize
      super "Argument 'palette' should not be empty. Please provide an array with color names."
    end
  end
end
