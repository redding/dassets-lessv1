=== **This has been archived and is not maintained.** ===

# Dassets::Lessv1

Dassets [engine](https://github.com/redding/dassets#compiling) for compiling [LESS CSS](http://lesscss.org/) using the [1.x.x ruby compiler](https://github.com/cloudhead/less/tree/v1.2.21).

## Usage

Register the engine:

```ruby
# in config/assets.rb
require 'dassets'
require 'dassets-lessv1'

Dassets.configure do |c|

  c.source "/path/to/assets") do |s|

    # register the Lessv1 engine to your source extension
    c.engine 'less', Dassets::Lessv1::Engine

  end

end
```

Put your `.less` source files in your source path.  Dassets will compile their content using the 1.x.x LESS ruby compiler, switch their extension to `.css`, and write the output to the output path.

## Why LESS 1.x.x?

Less v1 worked great back in the day and still works great today.  This is for those who need to use the older version or don't want the latest js-based implementation (and its dependencies) and don't mind running the older version.

Want to use LESS v2?  Write an engine for it and it'll get mentioned it here.

## Installation

Add this line to your application's Gemfile:

    gem 'dassets-lessv1'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dassets-lessv1

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
