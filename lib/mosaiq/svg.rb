# frozen_string_literal: true

require 'base64'

module Mosaiq
  # Generate SVG version of the Mosaiq
  class Svg
    def initialize(canvas)
      @canvas = canvas
      @width = canvas[0].count
      @height = canvas.count
    end

    def raw
      %(#{svg_header}#{svg_body}).delete("\n").gsub(/ +/, ' ')
    end

    def to_base64
      Base64.encode64(raw).delete("\n")
    end

    private

    def svg_header
      "#{svg_header_xml}#{svg_header_doctype}"
    end

    def svg_header_xml
      %(<?xml version="1.0" encoding="UTF-8"?>)
    end

    def svg_header_doctype
      %(<!DOCTYPE svg
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
