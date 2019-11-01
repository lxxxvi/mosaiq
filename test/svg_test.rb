# frozen_string_literal: true

require 'test_helper'
require 'nokogiri'

class SvgTest < Minitest::Test
  include Fixtures

  def test_raw_1x1
    svg = Mosaiq::Image.new(width: 1, height: 1, colors: ['#fff']).svg
    assert_equal read_fixture('1x1_fff.svg').chop, svg.raw
  end

  def test_raw_4x3
    svg = Mosaiq::Image.new(width: 4, height: 3, colors: ['#fff']).svg
    nhtml = Nokogiri::XML(svg.raw)

    assert_attributes(viewBox: '0 0 4 3', element: svg_element(nhtml))

    rect_elements(nhtml).tap do |rects|
      assert_equal 12, rects.count
      assert_attributes(x: '0', y: '0', width: '1', height: '1', style: 'fill: #fff;', element: rects[0])
    end
  end

  def test_to_base64
    svg = Mosaiq::Image.new(width: 1, height: 1, colors: ['#fff']).svg
    assert_equal read_fixture('1x1_fff_base64.txt').chop, svg.to_base64
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
