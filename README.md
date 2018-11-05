# Infurarb

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'infurarb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install infurarb

## Usage

A simple wrapper around Infura's API. So far only implemented for Ethereum.

```
irb> conn = InfuraRb::Connetion.new(token: YOUR_TOKEN)

irb> conn.gas_price =>

{
  jsonrpc: "2.0",
  id: 1,
  result: "0x3b9acde7"
}

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/LicenseRocks/infurarb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Infurarb project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/infurarb/blob/master/CODE_OF_CONDUCT.md).
