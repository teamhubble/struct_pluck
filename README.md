# StructPluck

Struct pluck allows you to have a clean pluck method that will convert the pluck ids into a hash!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'struct_pluck'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install struct_pluck

## Usage

Instead of working with directly pluck you can do like so...

```
MyModel.all.struct_pluck([:name, :tax, :car])
```

From there you'll get an array of structs that you can work with like so...

```
results.each do |item|
  puts item[:name]
  puts item[:tax]
  puts item[:car]
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on Cortex Git at http://git.cortex.ninja/

