$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "api_monkey/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "api_monkey"
  s.version     = ApiMonkey::VERSION
  s.authors     = ["Michael Kelly"]
  s.email       = ["michaelkelly322@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of ApiMonkey."
  s.description = "Description of ApiMonkey."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
  s.add_dependency 'active_model_serializers'

  s.add_development_dependency "pg"
end
