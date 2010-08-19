# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{zipit}
  s.version = "0.3.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alexander Shvets"]
  s.date = %q{2010-08-19}
  s.default_executable = %q{zipit}
  s.description = %q{Rake helper for zipping/unzipping project files.}
  s.email = %q{alexander.shvets@gmail.com}
  s.executables = ["zipit"]
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "CHANGES",
     "README",
     "Rakefile",
     "VERSION",
     "bin/zipit",
     "bin/zipit.bat",
     "lib/zipit.rb",
     "zipit.gemspec"
  ]
  s.homepage = %q{http://github.com/shvets/zipit}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.requirements = ["none"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Rake helper for zipping/unzipping project files. (Summary).}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rubyzip>, [">= 0.9.4"])
    else
      s.add_dependency(%q<rubyzip>, [">= 0.9.4"])
    end
  else
    s.add_dependency(%q<rubyzip>, [">= 0.9.4"])
  end
end

