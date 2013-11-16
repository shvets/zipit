require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'zipit'

describe Zipit do
  context "create zip archive from the dir" do

    it "should create new archive" do
      subject.zip :dir => "../lib", :archive => "../lib.zip"

      reader = ZipReader.new "../lib.zip"
      reader.list.should include("zipit/version.rb")
    end

    it "should not include test2" do
      subject.zip :dir => "../lib", :archive => "../lib.zip", :excludes => ["zipit/zipit.rb"]

      reader = ZipReader.new "../lib.zip"
      reader.list.should_not include("zipit/zipit.rb")
    end
  end
end

