# zipit_spec.rb

require 'zipit'

describe Zipit do
  context "create zip archive from the dir" do
    subject { Zipit.new }

    before do
      `mkdir -pv test/.svn`
      `mkdir -pv test/test1/.svn`
      `cp zipit_spec.rb test/test1/.svn`

      `mkdir -pv test/test1/test2/test3`
      `mkdir -pv test/test4/test5/test6/test7`
      `cp zipit_spec.rb test/test1/test2/test3`
      `cp zipit_spec.rb test/test4/test5/test6/test7`
    end

    after do
      `rm -r test`
    end

    it "should create new archive" do
      subject.zip :archive => "../test1.zip", :dir => "test"

      Zip::ZipFile.open("../test1.zip") do |zipfile|
        zipfile.find_entry('test1/test2/test3/zipit_spec.rb').should_not be_nil
      end
    end

    it "should not include test2" do
      subject.zip :archive => "../test2.zip", :dir => "test", :excludes => ["test2"]

      Zip::ZipFile.open("../test2.zip") do |zipfile|
        zipfile.find_entry('test1/test2/test3/zipit_spec.rb').should be_nil
      end
    end
  end
end

