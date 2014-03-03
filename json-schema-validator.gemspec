# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json/schema/validator/version'

Gem::Specification.new do |spec|
  spec.name          = "json-schema-validator"
  spec.version       = JSON::Schema::Validator::VERSION
  spec.authors       = ["Fernando Diaz Garrido"]
  spec.email         = ["fdiazgarrido@gmail.com"]
  spec.description   = %q{ JSON Schema specification ruby implementation }
  spec.summary       = %q{ JSON Schema specification ruby implementation }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
