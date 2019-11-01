# frozen_string_literal: true

module Fixtures
  def read_fixture(filename)
    fixtures_directory = File.expand_path('../fixtures', __dir__)
    fixtures_path = "#{fixtures_directory}/#{filename}"
    File.open(fixtures_path).read
  end
end
