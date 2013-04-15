require 'compass'
require 'breakpoint'

Compass::Frameworks.register("breakpoint-slicer", :path => "#{File.dirname(__FILE__)}/..")

module BreakpointSlicer
  VERSION = "1.0"
  DATE = "2013-04-09"
end