require 'test_helper'
require 'nokogiri'

class SvgTest < Minitest::Test
  def test_generate
    svg = Mosaiq::Image.new(4, 3, ['notreal']).svg
    nhtml = Nokogiri::XML(svg)

    assert_equal '0 0 4 3', nhtml.css('svg').first.attr('viewBox')

    nhtml.css('rect').tap do |rects|
      assert_equal 12, nhtml.css('rect').count
      first_rect = rects[0]

      assert_equal '0', first_rect.attr('x')
      assert_equal '0', first_rect.attr('y')
      assert_equal '1', first_rect.attr('width')
      assert_equal '1', first_rect.attr('height')
      assert_equal 'fill: notreal;', first_rect.attr('style')
    end
  end
end
