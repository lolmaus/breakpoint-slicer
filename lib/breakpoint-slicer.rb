require 'compass'
require 'breakpoint'

Compass::Frameworks.register("breakpoint-slicer", :path => "#{File.dirname(__FILE__)}/..")

module BreakpointSlicer
  VERSION = "1.4.0"
  DATE = "2015-11-21"
end
