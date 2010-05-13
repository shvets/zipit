# Rakefile for zipit

require "lib/zipit"
 
task :default => :zip

task :zip do
  zip :archive => "zipit.zip", :dir => "."
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "zipit"
    gemspec.summary = "Rake helper for zipping/unzipping project files. (Summary)."
    gemspec.description = "Rake helper for zipping/unzipping project files."
    gemspec.email = "alexander.shvets@gmail.com"
    gemspec.homepage = "http://github.com/shvets/zipit"
    gemspec.authors = ["Alexander Shvets"]
    gemspec.files = FileList["CHANGES", "zipit.gemspec", "Rakefile", "init.rb", "README", "VERSION", "lib/**/*", "bin/**/*"]
    gemspec.add_dependency "rubyzip", ">= 0.9.4"
    gemspec.executables = ['zipit']
    gemspec.requirements = ["none"]
    gemspec.bindir = "bin"    
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalsteaks-jeweler -s http://gems.github.com"
end

desc "Run gem code locally"
task :"run:gem" do
  command = "bin/zipit a.zip ."
  puts ruby("#{command}")
end

