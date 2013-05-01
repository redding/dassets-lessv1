require 'less'
require 'dassets/engine'
require "dassets-lessv1/version"

module Dassets::Lessv1

  class Engine < Dassets::Engine

    def ext(input_ext)
      'css'
    end

    def compile(input_content)
      ::Less::Engine.new(input_content).to_css
    end

  end

end
