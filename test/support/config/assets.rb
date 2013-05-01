require 'dassets'
require 'dassets-lessv1'

Dassets.configure do |c|
  c.root_path File.expand_path("../..", __FILE__)
  c.engine 'less', Dassets::Lessv1::Engine

end
