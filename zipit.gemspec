# -*- encoding: utf-8 -*-

require File.expand_path(File.dirname(__FILE__) + '/lib/zipit/version')

Gem::Specification.new do |spec|
  spec.name          = "zipit"
  spec.summary       = %q{Rake helper for zipping/unzipping project files. (Summary).}
  spec.description   = %q{Rake helper for zipping/unzipping project files.}
  spec.email         = "alexander.shvets@gmail.com"
  spec.authors       = ["Alexander Shvets"]
  spec.homepage      = "http://github.com/shvets/zipit"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.bindir = "bin"
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.version       = Zipit::VERSION

  spec.add_runtime_dependency "zip_dsl", [">= 0"]
  spec.add_development_dependency "gemspec_deps_gen", [">= 0"]
  spec.add_development_dependency "gemcutter", [">= 0"]
  
end
