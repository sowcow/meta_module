# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'meta_module/version'

Gem::Specification.new do |spec|
  spec.name          = "meta_module"
  spec.version       = MetaModule::VERSION
  spec.authors       = ["Alexander K"]
  spec.email         = ["xpyro@ya.ru"]
  spec.description   = %q{ few things around module subclassing }.strip
  spec.summary       = spec.description #%q{TODO: Write a gem summary}
  spec.homepage      = "https://github.com/sowcow/meta_module"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "mutant"
  spec.add_development_dependency "pry"
end
