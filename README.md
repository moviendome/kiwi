# Kiwi

[![Build Status](https://travis-ci.org/jferrer/kiwi.svg?branch=master)](https://travis-ci.org/jferrer/kiwi) [![Gem Version](https://badge.fury.io/rb/kiwi-ruby.svg)](https://badge.fury.io/rb/kiwi-ruby)

This is a Ruby wrapper for the [Tequila API](https://tequila.kiwi.com) ([Kiwi.com](https://www.kiwi.com)).

Currently only `search` and `location` are supported.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kiwi-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kiwi-ruby

## Setup

Initialize the gem with a valid API KEY:

```
  KiwiApi.api_key = "your-api-key"
```

## Supported endpoints

### search
Kiwi.com flights search API.

```ruby
  params = {
    fly_from: "CNX",
    fly_to: "BKK",
    date_from: "10/10/2019",
    date_to: "10/10/2019",
    return_from: "14/10/2019",
    return_to: "14/10/2019",
  }

  response = client.search(params)

  response.success? # true/false

  response.status # 200...

  response.body # results...

  response.errors # error message & full messages
```

### location
Locations is a simple API used to search, suggest and resolve locations in various situations.

```ruby
  params = {
    term: "Chiang Mai"
  }

  response = client.location(params)

  response.success? # true/false

  response.status # 200...

  response.body # results...

  response.errors # error message & full messages
```

## Get Api Key

To get access to the Tequila API, signup as an affiliate [here](https://tequila.kiwi.com/portal/login/register).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
