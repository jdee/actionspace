lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "actionspace/version"

Gem::Specification.new do |spec|
  spec.name        = 'actionspace'
  spec.version     = ActionSpace::VERSION
  spec.summary     = "Group Fastlane actions into namespaces"
  spec.description = "More to come"
  spec.authors     = ["Jimmy Dee"]
  spec.email       = 'jgvdthree@gmail.com'
  spec.files       = Dir["lib/**/*.rb"]
  spec.homepage    = 'http://github.com/jdee/pattern_patch'
  spec.license     = 'MIT'

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'fastlane', '~> 2.69'
  spec.add_development_dependency 'pry', '~> 0.11'
  spec.add_development_dependency 'rake', '< 13'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'rspec-simplecov', '~> 0.2'
  spec.add_development_dependency 'rspec_junit_formatter', '~> 0.3'
  spec.add_development_dependency 'rubocop', '0.50.0'
  spec.add_development_dependency 'simplecov', '~> 0.15'
  spec.add_development_dependency 'yard', '~> 0.9'
end
