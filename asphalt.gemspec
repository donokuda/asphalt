# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'asphalt/version'

Gem::Specification.new do |spec|
  spec.name          = "asphalt"
  spec.version       = Asphalt::VERSION
  spec.authors       = ["Don Okuda"]
  spec.email         = ["don.okuda@gmail.com"]
  spec.description   = "Asphalt paves the way for your Sass stylesheets!"
  spec.summary       = "Asphalt paves the way for your Sass stylesheets!"
  spec.homepage      = "https://github.com/donokuda/asphalt"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_dependency "thor", "~> 0.18.1"
  spec.add_dependency "sass", "~> 3.2.10"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"
end
