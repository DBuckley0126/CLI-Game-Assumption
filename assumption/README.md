# assumption
Flatiron: CLI Scrapper Game

A Command-line interface game which the user can select a year and play assume if a song is higher or lower in the chart.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'assumption'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install assumption

## Usage

You will be promted to enter a year between 1952 - 2019.
Press enter and you will be shown 2 songs from the top 100 chart music from that year.

You can enter 'h' to say that the second song is higher up in the chart than the first presented song,
or you can enter 'l' to say that the second song is lower in the chart than the first presented song.

If you are correct, you will go up a level.
The aim of the game is to get to the highest level.

If you loose, you can replay the game by pressing 'y' when prompted or you can press 'n' to quit game.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/assumption. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the assumption project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/assumption/blob/master/CODE_OF_CONDUCT.md).
