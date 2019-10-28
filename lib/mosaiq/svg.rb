# frozen_string_literal: true

module Mosaiq
  # Generate SVG version of the Mosaiq
  class Svg
    def initialize(canvas)
      @canvas = canvas
      @width = canvas[0].count
      @height = canvas.count
    end

    def generate
      %(#{svg_header} #{svg_body}).tr("\n", '').gsub(/ +/, ' ')
    end

    private

    def svg_header
      %(<?xml version="1.0" encoding="UTF-8"?>
         <!DOCTYPE svg
                   PUBLIC
                   "-//W3C//DTD SVG 1.1//EN"
                   "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">)
    end

    def svg_body
      %(<svg width="100%"
              height="100%"
              viewBox="0 0 #{@width} #{@height}"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg">#{svg_rectangles.join}</svg>)
    end

    def svg_rectangles
      @canvas.each_with_index.map do |row, y|
        row.each_with_index.map do |color, x|
          svg_rectangle(x, y, color)
        end
      end
    end

    def svg_rectangle(x_coordinates, y_coordinates, color)
      %(<rect x="#{x_coordinates}"
               y="#{y_coordinates}"
               width="1"
               height="1"
               style="fill: #{color};"/>)
    end
  end
end
