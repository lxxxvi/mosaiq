# frozen_string_literal: true

require 'test_helper'

class PaletteTest < Minitest::Test
  def test_black_and_white
    assert_includes Mosaiq::Palette.black_and_white, '#ffffff'
    assert_includes Mosaiq::Palette.black_and_white, '#000000'
  end

  def test_grays
    assert_includes Mosaiq::Palette.grays, 'rgb(0, 0, 0)'
    assert_includes Mosaiq::Palette.grays, 'rgb(127, 127, 127)'
    assert_includes Mosaiq::Palette.grays, 'rgb(255, 255, 255)'
  end

  def test_random_colors
    random_colors = Mosaiq::Palette.random_colors(8)
    assert_equal 8, random_colors.count
    assert_match(/rgb\([0-9]{1,3}, [0-9]{1,3}, [0-9]{1,3}\)/, random_colors[0])
  end
end
