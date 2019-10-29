# frozen_string_literal: true

require 'test_helper'
require 'nokogiri'

class SvgTest < Minitest::Test
  def test_generate
    svg = Mosaiq::Image.new(width: 4, height: 3, colors: ['notreal']).svg
    nhtml = Nokogiri::XML(svg)

    assert_attributes(viewBox: '0 0 4 3', element: svg_element(nhtml))

    rect_elements(nhtml).tap do |rects|
      assert_equal 12, rects.count
      assert_attributes(x: '0', y: '0', width: '1', height: '1', style: 'fill: notreal;', element: rects[0])
    end
  end

  private

  def svg_element(nhtml)
    nhtml.css('svg').first
  end

  def rect_elements(nhtml)
    nhtml.css('rect')
  end

  def assert_attributes(args = {})
    element = args.delete(:element)

    args.each do |key, value|
      assert_equal value, element.attr(key),
                   "Expected element '#{element}' to have attribute '#{key}' with value '#{value}'"
    end
  end
end
