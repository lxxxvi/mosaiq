# frozen_string_literal: true

require 'test_helper'

class SvgTest < Minitest::Test
  include Fixtures

  def test_raw
    svg = Mosaiq::Image.new(width: 2, height: 3, palette: ['#fff']).svg
    assert_equal read_fixture('2x3_fff.svg').chop, svg.raw
  end

  def test_to_base64
    svg = Mosaiq::Image.new(width: 1, height: 1, palette: ['#fff']).svg
    assert_equal read_fixture('1x1_fff_base64.txt').chop, svg.to_base64
  end
end
