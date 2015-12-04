$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "es6_tilt/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "es6_tilt"
  s.version     = Es6Tilt::VERSION
  s.authors     = ["Michael Archibald"]
  s.email       = ["micharch54@gmail.com"]
  s.homepage    = "http://github.com/neener54/es6_tilt"
  s.summary     = "Transpiles es6 to js"
  s.description = "Transforms .js files into js files so you can write es6 code and use it in your views."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", '~> 4.0'
  s.add_runtime_dependency "tilt", '~> 1.0'
  s.add_runtime_dependency "execjs",  '~> 2.0'
  s.add_runtime_dependency "sprockets", '~> 2.0'
	s.add_development_dependency "pry", '~> 0.10.3'
end
