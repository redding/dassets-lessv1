require 'less'
require 'dassets/engine'
require "dassets-lessv1/version"

module Dassets::Lessv1

  class Engine < Dassets::Engine

    def ext(input_ext)
      'css'
    end

    def compile(input_content)
      Source.new(input_content).to_css
    end

  end

  # This is a little wrapper class to the less engine.  I use this to access
  # and set the `@path` instance variable on the engine.  This sets the root
  # path all imports are done from.  This just makes importing partials easier.

  class Source < ::Less::Engine
    attr_reader :path
    def initialize(content, opts={})
      @path = Dassets.config.source_path
      super
    end
  end

end
