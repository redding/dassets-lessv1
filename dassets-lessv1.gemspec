# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dassets-lessv1/version"

Gem::Specification.new do |gem|
  gem.name        = "dassets-lessv1"
  gem.version     = Dassets::Lessv1::VERSION
  gem.authors     = ["Kelly Redding", "Collin Redding"]
  gem.email       = ["kelly@kellyredding.com", "collin.redding@me.com"]
  gem.summary     = %q{Dassets engine for compiling LESS CSS v1}
  gem.description = %q{Dassets engine for compiling LESS CSS v1}
  gem.homepage    = "http://github.com/redding/dassets-lessv1"
  gem.license     = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency("assert", ["~> 2.16.3"])

  # lock in to the 1.x.x LESS ruby compiler b/c this is Lessv1
  # ie https://github.com/cloudhead/less/tree/v1.2.21
  gem.add_dependency("less",    ["~> 1.1"])
  gem.add_dependency("dassets", ["~> 0.14.5"])

end
