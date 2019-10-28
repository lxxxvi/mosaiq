# frozen_string_literal: true

require 'mosaiq/svg'

module Mosaiq
  # Main class to create a Mosaiq Image
  class Image
    def initialize(width, height, colors = %w[fff 000])
      @width = read_positive_integer(width: width)
      @height = read_positive_integer(height: height)
      @colors = read_colors(colors)

      build_canvas
    end

    def svg
      Mosaiq::Svg.new(@canvas).generate
    end

    private

    def build_canvas
      total = @width * @height
      all_tiles = Array.new(total).map { @colors.sample }
      @canvas = all_tiles.each_slice(@width).collect(&:itself)
    end

    def read_positive_integer(args = {})
      key, value = args.first
      integer_value = value.to_i
      return integer_value if integer_value.positive?

      raise Mosaiq::InvalidDimensionArgument.new(key, value)
    end

    def read_colors(colors)
      return colors unless colors.empty?

      raise Mosaiq::InvalidColorsArgument
    end
  end
end
