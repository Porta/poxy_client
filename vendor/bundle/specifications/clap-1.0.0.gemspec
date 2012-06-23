# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "clap"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michel Martens"]
  s.date = "2012-03-29"
  s.description = "Clap is a small library that can be bundled with your command line application. It covers the simple case of executing code based on the flags or parameters passed."
  s.email = ["michel@soveran.com"]
  s.homepage = "http://github.com/soveran/clap"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "Command line argument parsing for simple applications."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<cutest>, [">= 0"])
    else
      s.add_dependency(%q<cutest>, [">= 0"])
    end
  else
    s.add_dependency(%q<cutest>, [">= 0"])
  end
end
