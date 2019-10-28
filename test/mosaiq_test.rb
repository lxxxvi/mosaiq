# frozen_string_literal: true

require 'test_helper'

class MosaiqTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Mosaiq::VERSION
  end

  def test_invalid_width
    error = assert_raises(Mosaiq::InvalidDimensionArgument) { Mosaiq::Image.new(0, 1) }
    assert_equal "Argument 'width' cannot be '0'. Please provide a number greater than 0.", error.message
  end

  def test_invalid_height
    error = assert_raises(Mosaiq::InvalidDimensionArgument) { Mosaiq::Image.new(1, 0) }
    assert_equal "Argument 'height' cannot be '0'. Please provide a number greater than 0.", error.message
  end

  def test_width_nil
    error = assert_raises(Mosaiq::InvalidDimensionArgument) { Mosaiq::Image.new(nil, 1) }
    assert_equal "Argument 'width' cannot be 'nil'. Please provide a number greater than 0.", error.message
  end

  def test_empty_colors
    error = assert_raises(Mosaiq::InvalidColorsArgument) { Mosaiq::Image.new(1, 1, []) }
    assert_equal "Argument 'colors' should not be empty. Please provide an array with color names.", error.message
  end
end
