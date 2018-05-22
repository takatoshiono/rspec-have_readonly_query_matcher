# Rspec::HaveReadonlyQueryMatcher

This library provides an rspec matcher that tests the code issues only read queries.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-have_readonly_query_matcher'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-have_readonly_query_matcher

## Usage

### Configuration

spec/spec_helper.rb:
```ruby
require 'rspec/have_readonly_query_matcher'

RSpec.configuration.include RSpec::HaveReadonlyQueryMatcher
```

### Matchers

- have_readonly_query
- have_only_read_query

```ruby
expect { do_something }.to have_readonly_query

# same thing
expect { do_something }.to have_only_read_query
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/takatoshiono/rspec-have_readonly_query_matcher.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
