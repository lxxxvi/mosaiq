require 'mosaiq/svg'

module Mosaiq
  class Image
    def initialize(width, height, colors = %w[fff 000])
      @width = Integer(width)
      @height = Integer(height)
      @colors = Array(colors)

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
  end
end
