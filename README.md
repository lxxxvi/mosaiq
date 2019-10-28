[![Build Status](https://travis-ci.org/lxxxvi/mosaiq.svg?branch=master)](https://travis-ci.org/lxxxvi/mosaiq)

# Mosaiq

Mosaiq creates images with randomly colored pixels.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mosaiq'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mosaiq

## Usage

Currently only SVG is supported.

### SVG

```ruby
mosaiq = Mosaiq::Image.new(3, 4, %w[red green blue])
puts mosaiq.svg
# => <?xml version="1.0" encoding="UTF-8"?> <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"> <svg width="100%" height="100%" viewBox="0 0 4 3" version="1.1" xmlns="http://www.w3.org/2000/svg"><rect x="0" y="0" width="1" height="1" style="fill: blue;"/><rect x="0" y="1" width="1" height="1" style="fill: green;"/><rect x="0" y="2" width="1" height="1" style="fill: red;"/><rect x="1" y="0" width="1" height="1" style="fill: red;"/><rect x="1" y="1" width="1" height="1" style="fill: red;"/><rect x="1" y="2" width="1" height="1" style="fill: red;"/><rect x="2" y="0" width="1" height="1" style="fill: blue;"/><rect x="2" y="1" width="1" height="1" style="fill: blue;"/><rect x="2" y="2" width="1" height="1" style="fill: red;"/><rect x="3" y="0" width="1" height="1" style="fill: red;"/><rect x="3" y="1" width="1" height="1" style="fill: blue;"/><rect x="3" y="2" width="1" height="1" style="fill: red;"/></svg>
```

which looks like this when saved to a file

| Result                                                        |
|---------------------------------------------------------------|
| ![Example mosaiq](./documentation/example_red_green_blue.svg) |

* The first argument is the `width` of the image.
* The second argument is the `height` of the image.
* The third argument is an array of color names. Any valid HTML color names will do.

## Palette

There are three predefined "Palettes" of colors:

| Palette            | Example                                                       | Result                                                                  |
|--------------------|---------------------------------------------------------------|-------------------------------------------------------------------------|
| `black_and_white`  | `Mosaiq::Image.new(10, 5, Mosaiq::Palette::black_and_white)`  | ![Example black_and_white](./documentation/example_black_and_white.svg) |
| `grays`            | `Mosaiq::Image.new(10, 5, Mosaiq::Palette::grays)`            | ![Example grays](./documentation/example_grays.svg)                     |
| `random_colors(n)` | `Mosaiq::Image.new(10, 5, Mosaiq::Palette::random_colors(8))` | ![Example random_colors](./documentation/example_random_colors_8.svg)   |


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mosaiq. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Mosaiq project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/mosaiq/blob/master/CODE_OF_CONDUCT.md).
