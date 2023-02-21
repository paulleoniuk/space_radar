# SpaceRadar

Space Radar is a command line tool that scans a radar file and checks it for the presence of space invader patterns.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'space_radar'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install space_radar

## Usage

To use Space Radar, you will need a radar file and a folder containing space invader patterns. For example:
```
SpaceRadar::Scanner.new('data/invaders/', 'data/radar.txt')
```

This will load all the space invader patterns from the invaders/ folder and scan the radar.txt file for the presence of these patterns.

After scanning, Space Radar will print out a list of the detected space invaders and the number of times they were found.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/paulleoniuk/space_radar. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/paulleoniuk/space_radar/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SpaceRadar project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/paulleoniuk/space_radar/blob/master/CODE_OF_CONDUCT.md).
