require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'zipit'

describe Zipit do
  context "create zip archive from the dir" do

    it "should create new archive" do
      subject.zip :dir => "config", :archive => "config.zip"

      reader = Zip::Reader.new "config.zip"
      reader.list.should include("config/application.rb")
    end

    it "should not include test2" do
      subject.zip :dir => "config", :archive => "config.zip", :excludes => ["config/environments"]

      reader = Zip::Reader.new "config.zip"
      reader.list.should_not include("config/environments/test.rb")
    end
  end
end

