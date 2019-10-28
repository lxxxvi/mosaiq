# frozen_string_literal: true

module Mosaiq
  # Palette defines various arrays of colors
  module Palette
    module_function

    def black_and_white
      %w[#ffffff #000000]
    end

    def grays
      0.upto(255).map { |n| "rgb(#{n}, #{n}, #{n})" }
    end

    def random_colors(number)
      number.times.map do
        "rgb(#{rand(256)}, #{rand(256)}, #{rand(256)})"
      end
    end
  end
end
