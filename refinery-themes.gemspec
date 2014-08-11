# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "refinery/themes/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "refinery_themes"
  s.version     = Themes::VERSION
  s.authors     = ["Alexander Negoda"]
  s.email       = ["alexander.negoda@gmail.com"]
  s.homepage    = "https://github.com/greendog/refinery-themes"
  s.summary     = "Themes Engine for RefineryCMS Engine"
  s.description = "Themes Support Engine for RefineryCMS based on Liquid Templating Language"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.require_paths = ["lib"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'refinerycms'
  s.add_dependency 'rubyzip'
  s.add_dependency 'clot_engine'
  s.add_dependency 'liquid'

end
