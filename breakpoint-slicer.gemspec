# -*- encoding: utf-8 -*-
require './lib/breakpoint-slicer'

Gem::Specification.new do |s|
  # General Project Information
  s.name = "breakpoint-slicer"
  s.version = BreakpointSlicer::VERSION
  s.date = BreakpointSlicer::DATE
  s.rubygems_version = "1.7.2"
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2")

  # Author Information
  s.authors = ["Andrey 'lolmaus' Mikhaylov"]
  s.email = ["lolmaus@gmail.com"]
  s.homepage = "https://github.com/lolmaus/breakpoint-slicer"

  # Project Description
  s.description = "A very quick and efficient syntax for Breakpoint"
  s.summary = "Along with Respond To, Breakpoint Slicer is an alternative syntax for Breakpoint. It offers a powerful yet very simple way to slice your media queries. Just list your breakpoints and Breakpoint Slicer will magically turn them into slices. You can address the with their sequence numbers."

  # Files to Include
  s.files = Dir.glob("lib/*.*")
  s.files += Dir.glob("stylesheets/**/*.*")
  s.files += Dir.glob("demo/**/*.*")

  # Dependent Gems
  s.add_dependency 'sass',                ">= 3.2.1"
  s.add_dependency 'compass',             ">= 0.12.2"
  s.add_dependency 'breakpoint',          ">= 2.0.1"
end
