require 'dassets'
require 'dassets-lessv1'

Dassets.config.source TEST_SUPPORT_ROOT.join("app/assets") do |s|
  s.engine 'less', Dassets::Lessv1::Engine
end
