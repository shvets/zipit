# Rakefile for zipit


$LOAD_PATH.unshift File.expand_path("lib", File.dirname(__FILE__))

require "rspec/core/rake_task"
require "zip_dsl/version"
require "gemspec_deps_gen/gemspec_deps_gen"

def version
  Zipit::VERSION
end

def project_name
  File.basename(Dir.pwd)
end

task :build do
  generator = GemspecDepsGen.new

  generator.generate_dependencies "#{project_name}.gemspec.erb", "#{project_name}.gemspec"

  system "gem build #{project_name}.gemspec"
end

task :release => :build do
  system "gem push #{project_name}-#{version}.gem"
end

RSpec::Core::RakeTask.new do |task|
  task.pattern = 'spec/**/*_spec.rb'
  task.verbose = false
end

require "lib/zipit"

task :default => :zip

task :zip do
  zip :archive => "zipit.zip", :dir => "."
end

desc "Run gem code locally"
task :"run:gem" do
  command = "bin/zipit a.zip ."
  puts ruby("#{command}")
end
