# frozen_string_literal: true

require 'test_helper'

class MosaiqTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Mosaiq::VERSION
  end

  def test_invalid_width
    error = assert_raises(Mosaiq::InvalidDimensionArgument) { Mosaiq::Image.new(width: 0, height: 1) }
    assert_equal "Argument 'width' cannot be '0'. Please provide a number greater than 0.", error.message
  end

  def test_invalid_height
    error = assert_raises(Mosaiq::InvalidDimensionArgument) { Mosaiq::Image.new(width: 1, height: 0) }
    assert_equal "Argument 'height' cannot be '0'. Please provide a number greater than 0.", error.message
  end

  def test_width_nil
    error = assert_raises(Mosaiq::InvalidDimensionArgument) { Mosaiq::Image.new(width: nil, height: 1) }
    assert_equal "Argument 'width' cannot be 'nil'. Please provide a number greater than 0.", error.message
  end

  def test_empty_colors
    error = assert_raises(Mosaiq::InvalidColorsArgument) { Mosaiq::Image.new(width: 1, height: 1, colors: []) }
    assert_equal "Argument 'colors' should not be empty. Please provide an array with color names.", error.message
  end
end
