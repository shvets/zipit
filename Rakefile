# Rakefile for zipit

require "lib/zipit_helper"
 
task :default => :zip

task :zip do
  zip :archive => "zipit.zip", :dir => "."
end

desc "Run gem code locally"
task :"run:gem" do
  command = "bin/zipit $1 $2"
  puts ruby("#{command}")
end

