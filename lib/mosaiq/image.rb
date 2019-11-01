# frozen_string_literal: true

require 'mosaiq/svg'

module Mosaiq
  # Main class to create a Mosaiq Image
  class Image
    def initialize(width:, height:, palette: Palette.black_and_white)
      @width = read_positive_integer(width: width)
      @height = read_positive_integer(height: height)
      @palette = read_palette(palette)

      build_canvas
    end

    def svg
      Mosaiq::Svg.new(@canvas)
    end

    private

    def build_canvas
      total = @width * @height
      all_tiles = Array.new(total).map { @palette.sample }
      @canvas = all_tiles.each_slice(@width).collect(&:itself)
    end

    def read_positive_integer(args = {})
      key, value = args.first
      integer_value = value.to_i
      return integer_value if integer_value.positive?

      raise Mosaiq::InvalidDimensionArgument.new(key, value)
    end

    def read_palette(palette)
      return palette unless palette.empty?

      raise Mosaiq::InvalidPaletteArgument
    end
  end
end
