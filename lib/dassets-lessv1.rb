require 'less'
require 'dassets/engine'
require "dassets-lessv1/version"

module Dassets::Lessv1

  class Engine < Dassets::Engine

    def ext(input_ext)
      'css'
    end

    def compile(input_content)
      compiler(input_content).to_css
    end

    def compiler(content)
      Compiler.new(content, self.opts)
    end

  end

  # This is a little wrapper class to the less engine.  I use this to access
  # and set the `@path` instance variable on the engine.  This sets the root
  # path all imports are done from to the path of the source the engine was
  # registered on.  This allows you to import partials relative to the source.

  class Compiler < ::Less::Engine
    attr_reader :path
    def initialize(content, opts)
      @path = opts['source_path']
      super
    end
  end

end
