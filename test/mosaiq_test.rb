require 'test_helper'

class MosaiqTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Mosaiq::VERSION
  end

  def test_invalid_width
    error = assert_raises(Mosaiq::InvalidDimensionArgument) do
      Mosaiq::Image.new(0, 1)
    end

    assert_equal "Argument 'width' cannot be '0'. Please provide a number greater than 0.",
                 error.message
  end

  def test_invalid_height
    error = assert_raises(Mosaiq::InvalidDimensionArgument) do
      Mosaiq::Image.new(1, 0)
    end

    assert_equal "Argument 'height' cannot be '0'. Please provide a number greater than 0.",
                 error.message
  end

  def test_width_nil
    error = assert_raises(Mosaiq::InvalidDimensionArgument) do
      Mosaiq::Image.new(nil, 1)
    end

    assert_equal "Argument 'width' cannot be 'nil'. Please provide a number greater than 0.",
                 error.message

  end
end
