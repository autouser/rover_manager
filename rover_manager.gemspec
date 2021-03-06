# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rover_manager/version'

Gem::Specification.new do |spec|
  spec.name          = "rover_manager"
  spec.version       = RoverManager::VERSION
  spec.authors       = ["Evgeny Grep"]
  spec.email         = ["gyorms@gmail.com"]

  spec.summary       = %q{Simple rover manager}
  spec.description   = %q{Simple rover manager}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
end
