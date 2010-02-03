# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{zipit}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
 
  s.authors = ["Alexander Shvets"]
  s.date = %q{2010-02-02}
  s.description = %q{Rake helper for zipping/unzipping project files.}
  s.email = %q{alexander.shvets@gmail.com}

  s.files = ["CHANGES", "zipitgemspec", "Rakefile", "README", "lib/zip_it.rb"]

  s.has_rdoc = true
  s.homepage = %q{http://github.com/shvets/zipit}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{zipit}
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{Rake helper for zipping/unzipping project files.}

  if s.respond_to? :specification_version then
    s.specification_version = 2
  end

  s.executables = ['translate', 't']
  s.platform = Gem::Platform::RUBY
  s.requirements = ["none"]
end
