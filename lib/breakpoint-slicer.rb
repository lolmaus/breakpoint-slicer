require 'compass'
require 'breakpoint'

Compass::Frameworks.register("breakpoint-slicer", :path => "#{File.dirname(__FILE__)}/..")

module BreakpointSlicer
  VERSION = "2.0.0"
  DATE    = "2015-11-23"
end
