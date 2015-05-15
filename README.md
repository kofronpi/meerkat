# Meerkat

A ruby wrapper for the Meerkat API.

[![Build Status](https://travis-ci.org/kofronpi/meerkat.svg)](https://travis-ci.org/kofronpi/meerkat)
[![Code Climate](https://codeclimate.com/github/kofronpi/meerkat/badges/gpa.svg)](https://codeclimate.com/github/kofronpi/meerkat)
[![Coverage Status](https://coveralls.io/repos/kofronpi/meerkat/badge.svg)](https://coveralls.io/r/kofronpi/meerkat)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'meerkat'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install meerkat

## Configuration

You must authenticate all requests with an api key (ask the Meerkat team).

You can configure like this:

```ruby
Meerkat.configure do |config|
  config.api_key = 'secret'
end
```

## Usage example

```ruby
# Fetch all broadcasts as raw JSON.
Meerkat.broadcasts

# Fetch a specific broadcast information by ID.
b = Meerkat.broadcast('3cdbb566-cded-4170-86d9-fbdb8bbcbcc9')
b.broadcaster.display_name
# "Jens Travolt"
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/meerkat/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Please read the code of conduct !