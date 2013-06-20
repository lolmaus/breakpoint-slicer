require 'compass'
require 'breakpoint'

Compass::Frameworks.register("breakpoint-slicer", :path => "#{File.dirname(__FILE__)}/..")

module BreakpointSlicer
  VERSION = "1.2"
  DATE = "2013-06-20"
end